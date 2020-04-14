package com.test.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FileDownload() {
        super();
    }

    // FileDownload?dir=upload&filename=" + fname;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String filename = request.getParameter("filename");
		String path = getServletContext().getRealPath("resources/upload");
		
		// 절대경로를 파일명과 연결
		String fullPath = path + System.getProperty("file.separator") + filename;
		File f = new File(fullPath);

		byte[] buf = new byte[2048];
		
		//전송할 데이터가 스트림 처리될 때 문자셋을 지정
		response.setContentType("application/octet-stream;charset=8859_1");
		//다운로드 대화상자 처리
		response.setHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("utf-8"),"8859_1"));
		//전송타입이 이진데이터(binary)
		response.setHeader("Content-Transfer-Encoding",	"binary");
		
		if(f.isFile()) {
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));			
			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());	// 응답을 위한 stream
			
			int size = -1;
			try {
				while((size = bis.read(buf)) != -1) {
					bos.write(buf, 0, size);
					bos.flush();
				}
			} catch (Exception e) { 
				e.printStackTrace();
			} finally {
				if(bos != null) { bos.close(); }
				if(bis != null) { bis.close(); }
			}
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
