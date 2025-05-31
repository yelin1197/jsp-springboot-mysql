package org.whs.dev2.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.whs.dev2.entity.Post;

public interface PostRepository extends JpaRepository<Post, Long> {
}