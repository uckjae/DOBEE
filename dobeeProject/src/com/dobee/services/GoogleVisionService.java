package com.dobee.services;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.google.api.Page;
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Block;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.Paragraph;
import com.google.cloud.vision.v1.Symbol;
import com.google.cloud.vision.v1.TextAnnotation;
import com.google.cloud.vision.v1.Word;
import com.google.protobuf.ByteString;



@Service
public class GoogleVisionService {

		
	public JSONObject goGoogle(String path) {
		
		List<String> keyUseLocation = null;
		List<String> keyUseCost = null;
		
		List<AnnotateImageResponse> responses = null;
		JSONObject jsonObj = new JSONObject();
		try {
			String imageFilePath = path;
			List<AnnotateImageRequest> requests = new ArrayList<AnnotateImageRequest>();
			
			ByteString imgBytes = ByteString.readFrom(new FileInputStream(imageFilePath));
		
			Image img = Image.newBuilder().setContent(imgBytes).build();
			Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
			AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
			requests.add(request);
			
		
			try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
				BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			    responses = response.getResponsesList();
		
			    for (AnnotateImageResponse res : responses) {
			    	if (res.hasError()) {
			    		System.out.println("구글API 에서 에러 발생");
			    		System.out.printf("Error: %s\n", res.getError().getMessage());
			    		return null;
			    	}else {
			    		TextAnnotation annotation = res.getFullTextAnnotation();
			    		int number = 0;
			    		for (com.google.cloud.vision.v1.Page page: annotation.getPagesList()) {
			                String pageText = "";
			                for (Block block : page.getBlocksList()) {
			                    String blockText = "";
			                    for (Paragraph para : block.getParagraphsList()) {
			                        String paraText = "";
			                        for (Word word: para.getWordsList()) {
			                            String wordText = "";
			                            for (Symbol symbol: word.getSymbolsList()) {
			                            	wordText = symbol.getText();
			                            	paraText = paraText + wordText;
			                            }
			                        }
			                        blockText = blockText + paraText;
			                    }
		                        String sNum = Integer.toString(number);
		                        jsonObj.put("key"+sNum, blockText);
		                        number++;
			                }
			            }
			    	}
			    }
				}catch (Exception e) {
					System.out.println("서비스단/GoogleVisionApi : 내부 try구문 에러 :" + e);
				}
			
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("서비스단/GoogleVisionApi : try 구문에러 : " + e);
			}
		return jsonObj;
	}
		
		
		
	
	
}
