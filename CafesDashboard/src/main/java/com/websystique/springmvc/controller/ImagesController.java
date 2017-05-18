package com.websystique.springmvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.amazonaws.services.s3.model.S3ObjectSummary;
import com.jcraft.jsch.JSchException;
import com.websystique.springmvc.App;

@RestController
public class ImagesController {

    @RequestMapping(value = "/load-images", method = RequestMethod.GET)
    public @ResponseBody List<ImageDTO> getImagesNew() throws Exception {
	System.out.println("Am i called?");
	List<S3ObjectSummary> summaries = App.fetchAllImagesFromS3();

	List<ImageDTO> dto = new ArrayList<>();
	if (null != summaries) {
	    for (S3ObjectSummary s3ObjectSummary : summaries) {
		if (s3ObjectSummary.getSize() > 0) {
		    ImageDTO d = new ImageDTO();
		    d.setFullPath(("https://s3.amazonaws.com/images.itsagrinduae.com/"
			    + s3ObjectSummary.getKey()));
		    d.setImgName(s3ObjectSummary.getKey().replace("images/", ""));
		    dto.add(d);
		}
	    }
	}

	return dto;
    }

    @RequestMapping(value = "/delete_img", method = RequestMethod.POST)
    public @ResponseBody boolean deleteImage(@RequestBody String fileName) throws JSchException {
	System.out.println(fileName);

	return App.deleteImage(fileName);

    }

    class ImageDTO {
	private String imgName;
	private String fullPath;

	public void setImgName(String imgName) {
	    this.imgName = imgName;
	}

	public String getImgName() {
	    return imgName;
	}

	public void setFullPath(String fullPath) {
	    this.fullPath = fullPath;
	}

	public String getFullPath() {
	    return fullPath;
	}

    }

}
