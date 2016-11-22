
package com.erp.fileupload.dao;

import java.util.List;

import com.erp.fileupload.model.Image;

public interface ImageDao {
    
    public List<Image> list();
    
    public Image create(Image image);
    
    public Image get(Long id);
    
    public void delete(Image image);
}
