package com.whs.dev2.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.whs.dev2.entity.Post;
import com.whs.dev2.entity.User;
import com.whs.dev2.service.PostService;
import com.whs.dev2.dto.PostRequestDto;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/board")
public class PostPageController {

    private final PostService postService;

    public PostPageController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping("/posts")
    public String listPosts(Model model) {
        model.addAttribute("posts", postService.getAllPosts());
        return "postList";
    }

    @GetMapping("/newPost")
    public String showNewPostForm(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("loginUserId", user.getId());
        model.addAttribute("loginUsername", user.getUsername());
        return "postForm";
    }

    @PostMapping("/newPost")
    public String createPost(@ModelAttribute PostRequestDto dto, HttpSession session) {
        User loginUser = (User) session.getAttribute("user");
        if (loginUser == null) {
            return "redirect:/login";
        }

        // author 값을 세팅 (폼에서 전달되지 않으면 수동으로 넣기)
        dto.setAuthor(loginUser.getUsername()); // 또는 getName()

        postService.createPost(dto, loginUser);
        return "redirect:/board/posts";
    }

}