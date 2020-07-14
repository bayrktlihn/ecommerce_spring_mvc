package com.bayrktlihn.entity;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Demo {
	private String demo;
	private MultipartFile image;
}
