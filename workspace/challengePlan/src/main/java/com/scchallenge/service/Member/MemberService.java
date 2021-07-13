package com.scchallenge.service.Member;

import com.scchallenge.vo.Member;

public interface MemberService {
	public String insertMember(Member member) throws Exception;
	public Member getMemberDetail(String uid) throws Exception;
	public String updateMember(Member member) throws Exception;
	public String deleteMember(String uid) throws Exception;
}
