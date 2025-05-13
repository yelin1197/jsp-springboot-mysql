package org.whs.dev2.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.whs.dev2.entity.Post;
import org.whs.dev2.repository.PostRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PostService {

    private final PostRepository postRepository;

    public List<Post> getAllPosts() {
        return postRepository.findAll();
    }

    public void save(Post post) {
        postRepository.save(post);
    }
}