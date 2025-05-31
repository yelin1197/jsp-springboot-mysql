package org.whs.dev2.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.whs.dev2.dto.PostRequestDto;
import org.whs.dev2.dto.PostResponseDto;
import org.whs.dev2.entity.Post;
import org.whs.dev2.entity.User;
import org.whs.dev2.jwt.JwtUtil;
import org.whs.dev2.service.PostService;
import org.whs.dev2.service.UserService;

import java.io.File;
import java.io.IOException;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class PostApiController {

    private final PostService postService;
    private final UserService userService;
    private final JwtUtil jwtUtil;

    //게시글 목록 조회
    @GetMapping("api/posts")
    public ResponseEntity<List<PostResponseDto>> getAllPosts() {
        List<Post> posts = postService.getAllPosts();
        List<PostResponseDto> responseList = posts.stream()
                .map(PostResponseDto::new)
                .toList();
        return ResponseEntity.status(HttpStatus.OK).body(responseList);
    }

    //게시글 단일 조회
    @GetMapping("/api/post/{id}")
    public ResponseEntity<PostResponseDto> getPost(@PathVariable Long id) {
        Post post = postService.findById(id);
        return ResponseEntity.status(HttpStatus.OK).body(new PostResponseDto(post));
    }

    //게시글 작성(회원만)
    @PostMapping(value = "/api/post", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> createPost(@RequestPart("post") PostRequestDto dto,
                                        @RequestPart(value = "file", required = false) MultipartFile file,
                                        @RequestHeader("Authorization") String authHeader) {

        User user = authenticate(authHeader);
        if (user == null) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인 필요");

        Post post = new Post();
        post.setTitle(dto.getTitle());
        post.setContent(dto.getContent());


//        // 파일 업로드 기능 추가
//        if (file != null && !file.isEmpty()) {
//            try {
//                String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
//                File uploadDir = new File("uploads");
//
//                // 디렉토리가 없고 생성도 실패한 경우
//                if (!uploadDir.exists() && !uploadDir.mkdirs()) {
//                    System.err.println("❌ [ERROR] uploads 디렉토리 생성 실패");
//                    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 저장 경로 생성 실패");
//                }
//
//                File savedFile = new File(uploadDir, fileName);
//                file.transferTo(savedFile);
//
//                // 경로 출력
//                System.out.println("✅ [INFO] 파일 저장 경로: " + savedFile.getAbsolutePath());
//
//                post.setFilePath(savedFile.getAbsolutePath()); // 경로가 잘 보이도록 절대 경로로 저장
//            } catch (IOException e) {
//                System.err.println("❌ [ERROR] 파일 저장 실패: " + e.getMessage());
//                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 저장 실패");
//            }
//        }


        postService.save(post, user);
        return ResponseEntity.ok(new PostResponseDto(post));
    }


    //게시글 수정(회원만)
    @PutMapping("/api/post/{id}")
    public ResponseEntity<?> updatePost(@PathVariable Long id,
                                        @RequestBody PostRequestDto dto,
                                        @RequestHeader("Authorization") String authHeader) {
        User user = authenticate(authHeader);
        if (user == null) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인 필요");

        boolean success = postService.update(id, dto, user);
        return success ? ResponseEntity.ok("수정 완료") : ResponseEntity.status(HttpStatus.FORBIDDEN).body("권한 없음");
    }

    //게시글 삭제(회원만)
    @DeleteMapping("/api/post/{id}")
    public ResponseEntity<?> deletePost(@PathVariable Long id,
                                        @RequestHeader("Authorization") String authHeader) {
        User user = authenticate(authHeader);
        if (user == null) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인 필요");

        boolean success = postService.delete(id, user);
        return success ? ResponseEntity.ok("삭제 완료") : ResponseEntity.status(HttpStatus.FORBIDDEN).body("권한 없음");
    }

    // 공통 인증 메서드
    private User authenticate(String authHeader) {
        //Authorization 헤더가 없거나 "Bearer "로 시작하지 않으면 → 인증되지 않은 사용자로 간주 → null 리턴
        if (authHeader == null || !authHeader.startsWith("Bearer ")) return null;
        //"Bearer " 다음부터 토큰 내용만 잘라냄
        String token = authHeader.substring(7);
        //토큰 유효성 확인 후 username만 뽑아내기
        String username = jwtUtil.validateAndExtractUsername(token);
        if (username == null) return null;
        return userService.findByUsername(username);
    }
}
