package com.repository;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.UserEntity;
@Repository
public interface iUserRepo extends JpaRepository<UserEntity, Integer>{
	//dinh nghia them mot so method
	UserEntity findByTentaikhoan(String tentaikhoan);
	UserEntity findById(int id);
	

}
