package com.icia.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.project.dto.EduCommentDTO;
import com.icia.project.dto.EduCommentLikeDTO;
import com.icia.project.dto.EducationDTO;
import com.icia.project.dto.ReviewDTO;
@Repository
public class EducationDAO {


	@Autowired
	private SqlSessionTemplate sql;
	
	
	// 교육 상세보기
	public EducationDTO educationView(int eduNum) {
		return sql.selectOne("education.educationView",eduNum);
	}

	
	/*
	 * // 교육 조회수 public void eduHit(int eduNum) {
	 * sql.update("Education.eduHit",eduNum);
	 * 
	 * }
	 */

	// 교육 리스트
	//목록 가져올 게시글 카운팅하기
		public int ListCount(HashMap<String, Object> map) {
			return sql.selectOne("education.eduCount", map);
		}

		//리뷰 좋아요 순 정렬 데이터 요청
		public List<EducationDTO> eduLikeLineUp(HashMap<String, Object> map) {
			return sql.selectList("education.eduLikeLineUp", map);
		}
		//리뷰 오래된 순 정렬 데이터 요청
		public List<EducationDTO> eduHitLineUp(HashMap<String, Object> map) {
			return sql.selectList("education.eduHitLineUp", map);
		}
		//교육리스트
		public List<EducationDTO> eduList(HashMap<String, Object> map) {
			return sql.selectList("education.eduList",map);
		}

	//==========================================================
	
	// 댓글 리스트
	public List<EduCommentDTO> educationCommentList(int commentEduNum) {
		return sql.selectList("education.eduCommentList",commentEduNum);
	}

	// 댓글 작성
	public int educationComment(EduCommentDTO eduComment) {
		return sql.insert("education.eduComment",eduComment);
	}

	// 댓글 좋아요 삭제
	public int educationCommentLikeDelete(EduCommentDTO eduComment) {
		return sql.delete("education.eduCommentLikeDelete",eduComment);
	}

	// 댓글 삭제
	public int educationCommentDelete(EduCommentDTO eduComment) {
		return sql.delete("education.eduCommentDelete",eduComment);
	}

	// 좋아요 회원 id체크
	public EduCommentLikeDTO educationCommentLikeCheck(EduCommentDTO eduComment) {
		return sql.selectOne("education.eduCommentLikeCheck",eduComment);
	}

	// 댓글 좋아요 취소
	public int educationCommentUnLike(EduCommentDTO eduComment) {
		return sql.update("education.eduCommentUnLike",eduComment);
	}

	// 좋아요 취소 누를시 테이블 아이디 삭제
	public int educationCommentLikeUserIdDelete(EduCommentDTO eduComment) {
		return sql.delete("education.eduCommentLikeUserIdDelete",eduComment);
	}

	// 좋아요 테이블 값 넣기
	public int educationCommentLikeAdd(EduCommentDTO eduComment) {
		return sql.insert("education.eduCommentLikeAdd",eduComment);
	}

	// 댓글 좋아요
	public int educationCommentLike(EduCommentDTO eduComment) {
		return sql.update("education.eduCommentLike",eduComment);
	}

	// 댓글 수정
	public int educationCommentModify(EduCommentDTO eduComment) {
		return sql.update("education.eduCommentModify",eduComment);
	}

	// 교육 게시글 좋아요
	public void educationLike(EducationDTO education) {
		sql.update("education.educationLike",education);
	}

	// 교육 게시글 좋아요Id
	public void eduLikeUser(EducationDTO education) {
		sql.insert("education.eduLikeUser",education);
	}

	// 교육 게시글 좋아요 취소
	public void educationUnLike(EducationDTO education) {
		sql.update("education.educationUnLike",education);
	}

	// 교육 게시글 좋아요 취소 Id
	public void eduUnLikeUser(EducationDTO education) {
		sql.insert("education.eduUnLikeUser",education);
	}

	//좋아요 수 ㅈ회
	public int eduLike(EducationDTO education) {

		return sql.selectOne("education.eduLike",education);	
	}

	//좋아요 아이디 조회	
	public String eduLikeUserId(EducationDTO education) {
		return sql.selectOne("education.eduLikeUserIdCheck",education);
	}




	


}





