package com.websystique.springmvc;

import java.io.File;
import java.util.Date;
import java.util.List;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ListObjectsRequest;
import com.amazonaws.services.s3.model.ObjectListing;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.PutObjectResult;
import com.amazonaws.services.s3.model.S3ObjectSummary;

/**
 * Hello world!
 *
 */
public class App {
	private static String bucketName = "images.itsagrinduae.com/images";

	public static String url = "https://s3.amazonaws.com/images.itsagrinduae.com/images/";

	public static boolean uploadToS3(File file, String fileName) {
		try {
			System.out.println("upload to s3");
			AWSCredentials credentials = new BasicAWSCredentials("AKIAJN4SGGLDMNHIPJZQ",
					"qwLsRQbzRTZfjvwYygALx2ewnq4Q1w6FP+krpBuW");

			AmazonS3 s3client = new AmazonS3Client(credentials);
			System.out.println(new Date());
			s3client.setBucketAcl(bucketName, CannedAccessControlList.PublicReadWrite);
			System.out.println(new Date());
			System.out.println("middle");
			PutObjectRequest por = new PutObjectRequest(bucketName, fileName, file)
					.withCannedAcl(CannedAccessControlList.PublicRead);
			PutObjectResult result = s3client.putObject(por);
			System.out.println(result);
			if (null == result)
				return false;
			else
				return true;
		} catch (Exception e) {
			return false;
		}

	}

	public static List<S3ObjectSummary> fetchAllImagesFromS3() {
		List<S3ObjectSummary> summaries = null;
		try {
			AWSCredentials credentials = new BasicAWSCredentials("AKIAJN4SGGLDMNHIPJZQ",
					"qwLsRQbzRTZfjvwYygALx2ewnq4Q1w6FP+krpBuW");

			AmazonS3 s3client = new AmazonS3Client(credentials);
			final ListObjectsRequest listObjectRequest = new ListObjectsRequest()
					.withBucketName("images.itsagrinduae.com").withPrefix("images");

			ObjectListing objectListing = s3client.listObjects(listObjectRequest);

			summaries = objectListing.getObjectSummaries();
			while (objectListing.isTruncated()) {
				objectListing = s3client.listNextBatchOfObjects(objectListing);

				summaries.addAll(objectListing.getObjectSummaries());
			}

		} catch (Exception e) {
			return null;
		}
		return summaries;

	}

	public static boolean deleteImage(String key) {
		try {
			AWSCredentials credentials = new BasicAWSCredentials("AKIAJN4SGGLDMNHIPJZQ",
					"qwLsRQbzRTZfjvwYygALx2ewnq4Q1w6FP+krpBuW");

			AmazonS3 s3client = new AmazonS3Client(credentials);
			s3client.deleteObject("images.itsagrinduae.com", "images/" + key);
		} catch (Exception e) {
			return false;
		}
		return true;

	}

}
