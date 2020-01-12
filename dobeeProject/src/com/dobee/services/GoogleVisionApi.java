package com.dobee.services;

import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.protobuf.ByteString;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;



@Service
public class GoogleVisionApi {

	public GoogleVisionApi() {
		System.out.println("서비스단/GoogleVisionApi : 구글 비전 API  생성자 실행");
	}	
	private void goGoogle() {

		try {
			String imageFilePath = "/users/psh/image/1.jpeg";
			
			List<AnnotateImageRequest> requests = new ArrayList<>();
		
			ByteString imgBytes = ByteString.readFrom(new FileInputStream(imageFilePath));
		
			Image img = Image.newBuilder().setContent(imgBytes).build();
			Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
			AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
			requests.add(request);
		
			try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
				BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			    List<AnnotateImageResponse> responses = response.getResponsesList();
		
			    for (AnnotateImageResponse res : responses) {
			    	if (res.hasError()) {
			    		System.out.printf("Error: %s\n", res.getError().getMessage());
			    		return;
			    	}
		
			    	System.out.println("Text : ");
			    	System.out.println(res.getTextAnnotationsList().get(0).getDescription());
			      

			    }
			}catch (Exception e) {
				System.out.println("서비스단/GoogleVisionApi : 내부 try구문 에러 :" + e);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("서비스단/GoogleVisionApi : try 구문에러 : " + e);
		}
	}
		
		
		
	
	
}
