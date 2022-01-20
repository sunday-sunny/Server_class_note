package com.test.openapi;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

public class BookDAO {

	// 결과를 콘솔로 찍는 용도
	public void test() {
		String clientId = "OWpGXqchhO95LamtTTkJ"; // 애플리케이션 클라이언트 아이디값"
		String clientSecret = "F4OuIymcSv"; // 애플리케이션 클라이언트 시크릿값"

		String text = null;
		try {
			text = URLEncoder.encode("자바", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}

		// String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text; //
		// json 결과
		String apiURL = "https://openapi.naver.com/v1/search/book.xml?query=" + text; // xml 결과

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL, requestHeaders);

		System.out.println(responseBody);
	}

	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}

	// 결과를 Arraylist로 변환해서 반환
	public ArrayList<BookDTO> list(String query, int start) {

		String clientId = "OWpGXqchhO95LamtTTkJ"; // 애플리케이션 클라이언트 아이디값"
		String clientSecret = "F4OuIymcSv"; // 애플리케이션 클라이언트 시크릿값"

		String text = null;
		try {
			text = URLEncoder.encode(query, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}

		// String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text; // json 결과
		String apiURL = "https://openapi.naver.com/v1/search/book.xml?query=" + text + "&start=" + start; // xml 결과

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL, requestHeaders);

		
		
		/* Java > XML 파싱(Parsing) */
		try {
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();

			// dom꺼로 import
			// document 객체 (= JavaScript의 document 유사)
			Document document = builder.parse(new InputSource(new StringReader(responseBody)));
			
			// org.w3c.dom.Element;
			Element rss = document.getDocumentElement();
			
			ArrayList<BookDTO> list = new ArrayList<BookDTO>();
			
			NodeList nlist = document.getElementsByTagName("item");
			
			
			for(int i = 0; i  < nlist.getLength(); i++) {
				Node node = nlist.item(i);
				BookDTO dto = new BookDTO();
				
				// System.out.println(node.getChildNodes().item(0).getTextContent());
				dto.setTitle(node.getChildNodes().item(0).getTextContent());
				dto.setLink(node.getChildNodes().item(1).getTextContent());
				dto.setImage(node.getChildNodes().item(2).getTextContent());
				dto.setAuthor(node.getChildNodes().item(3).getTextContent());
				dto.setPrice(node.getChildNodes().item(4).getTextContent());
				dto.setDiscount(node.getChildNodes().item(5).getTextContent());
				dto.setPublisher(node.getChildNodes().item(6).getTextContent());
				dto.setPubdate(node.getChildNodes().item(7).getTextContent());
				dto.setIsbn(node.getChildNodes().item(8).getTextContent());
				dto.setDescription(node.getChildNodes().item(9).getTextContent());
				
				list.add(dto);
			}
			
			return list;
		
		} catch (Exception e) {
			System.out.println("BookDAO.list()");
			e.printStackTrace();
		}

		return null;
	}

	public HashMap<String, Integer> getPageInfo(String query, int start2) {
		String clientId = "OWpGXqchhO95LamtTTkJ"; // 애플리케이션 클라이언트 아이디값"
		String clientSecret = "F4OuIymcSv"; // 애플리케이션 클라이언트 시크릿값"

		String text = null;
		try {
			text = URLEncoder.encode(query, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}

		// String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text; // json 결과
		String apiURL = "https://openapi.naver.com/v1/search/book.xml?query=" +  text + "&start=" + start2; // xml 결과

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL, requestHeaders);

		
		
		/* Java > XML 파싱(Parsing) */
		try {
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();

			// dom꺼로 import
			// document 객체 (= JavaScript의 document 유사)
			Document document = builder.parse(new InputSource(new StringReader(responseBody)));
			
			// org.w3c.dom.Element;
			// 문서 루트 태그
			Element rss = document.getDocumentElement();
			
			int total = Integer.parseInt(rss.getFirstChild().getChildNodes().item(4).getTextContent());
			int start = Integer.parseInt(rss.getFirstChild().getChildNodes().item(5).getTextContent());
			
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("total", total);
			map.put("start", start);
			map.put("totalPage", (int)Math.ceil((double)total / 10));
			
			return map;
			
		} catch (Exception e) {
			System.out.println("BookDAO.list()");
			e.printStackTrace();
		}
		
		return null;
	}
}
