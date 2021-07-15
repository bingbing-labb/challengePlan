package com.scchallenge.vo;

import lombok.Data;

@Data
public class Member {
	String uid;
	String userName;
	String name;
	String mobile;
	String userId;
	int planNum;
	int challNum;
	int follower;
	int following;

}
