package com.vovanthinh.util;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.Locale;
import java.util.UUID;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.Part;

public final class FileUploadUtil {
    private FileUploadUtil() {}

    public static String saveImage(ServletContext context, Part part) throws IOException {
        if (part == null || part.getSize() == 0) return null;
        String contentType = part.getContentType();
        if (contentType == null || !contentType.toLowerCase(Locale.ROOT).startsWith("image/")) {
            throw new IOException("Chỉ cho phép tải lên file hình ảnh.");
        }
        if (part.getSize() > 5 * 1024 * 1024) {
            throw new IOException("Kích thước ảnh tối đa là 5MB.");
        }
        String original = part.getSubmittedFileName();
        String ext = "";
        if (original != null && original.lastIndexOf('.') >= 0) {
            ext = original.substring(original.lastIndexOf('.')).toLowerCase(Locale.ROOT);
        }
        if (!ext.matches("\\.(jpg|jpeg|png|gif|webp|svg)")) {
            throw new IOException("Định dạng ảnh không được hỗ trợ.");
        }
        String fileName = UUID.randomUUID() + ext;
        String realPath = context.getRealPath("/images/uploads");
        if (realPath == null) throw new IOException("Không xác định được thư mục upload.");
        Path dir = Path.of(realPath);
        Files.createDirectories(dir);
        try (InputStream in = part.getInputStream()) {
            Files.copy(in, dir.resolve(fileName), StandardCopyOption.REPLACE_EXISTING);
        }
        return "uploads/" + fileName;
    }
}
