package com.vovanthinh.filter;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class SiteMeshFilter extends ConfigurableSiteMeshFilter {

    @Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
        builder
            // Exclude WEB-INF & static resources
            .addExcludedPath("/WEB-INF/*")
            .addExcludedPath("/css/*")
            .addExcludedPath("/js/*")
            .addExcludedPath("/images/*")
            .addExcludedPath("/static/*")
            .addExcludedPath("/assets/*")

            // In SiteMesh 3, the default prefix is already "/WEB-INF/decorators/".
            // Therefore, we only specify the file name.
            .addDecoratorPath("/admin/*", "admin.jsp")
            .addDecoratorPath("/*", "web.jsp");
    }
}
