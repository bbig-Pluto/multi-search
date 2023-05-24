package com.post.repository.post;

import com.post.domain.posts.File;
import com.post.web.dto.request.FileRequestDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FileMapper {

    int saveFiles(List<FileRequestDto> files);

    int deleteFilesById(Long postId);

    List<File> getFiles(Long postId);

}
