package com.example.projectend.repository;

import com.example.projectend.entity.NhapKho;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface NhapKhoRepository extends JpaRepository<NhapKho, Integer> {

    @Modifying
    @Query("DELETE FROM NhapKho n WHERE n.sanPham.maSP = :maSP")
    void deleteBySanPham_MaSP(@Param("maSP") Integer maSP);
}