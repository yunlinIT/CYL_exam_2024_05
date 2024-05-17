package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.FAQ;

@Mapper
public interface FAQRepository {

	@Select("""
			<script>
			SELECT COUNT(*) AS cnt
			FROM FAQ AS F
			WHERE 1
			<if test="searchKeyword != ''">
				<choose>
					<otherwise>
						AND F.question LIKE CONCAT('%',#{searchKeyword},'%')
						OR F.answer LIKE CONCAT('%',#{searchKeyword},'%')
					</otherwise>
				</choose>
			</if>
			ORDER BY id DESC
			</script>
			""")
	int getFAQCount(String searchKeyword);

	@Select("""
			<script>
			SELECT F.*
			FROM FAQ AS F
			WHERE 1
			<if test="searchKeyword != ''">
				<choose>
					<otherwise>
						AND F.question LIKE CONCAT('%',#{searchKeyword},'%')
						OR F.answer LIKE CONCAT('%',#{searchKeyword},'%')
					</otherwise>
				</choose>
			</if>
			ORDER BY F.id DESC
			</script>
			""")
	List<FAQ> getForPrintFAQ(String searchKeyword);

}
