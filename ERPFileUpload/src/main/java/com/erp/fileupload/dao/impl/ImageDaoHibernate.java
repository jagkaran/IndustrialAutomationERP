
package com.erp.fileupload.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.erp.fileupload.dao.ImageDao;
import com.erp.fileupload.model.Image;

@Repository
@Transactional
public class ImageDaoHibernate implements ImageDao {
    
    private static final Logger log = LoggerFactory.getLogger(ImageDaoHibernate.class);
    
    @Autowired
    private SessionFactory sessionFactory;
    
    private Session currentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Image> list() {
        log.debug("List of images");
        Query query = currentSession().getNamedQuery("images");
        List<Image> images = query.list();
        return images;
    }

    @Override
    public Image create(Image image) {
        log.debug("Creating image");
        currentSession().save(image);
        return image;
    }

    @Override
    @Transactional(readOnly = true)
    public Image get(Long id) {
        log.debug("Getting image {}", id);
        Image image = (Image) currentSession().get(Image.class, id);
        return image;
    }

    @Override
    public void delete(Image image) {
        log.debug("Deleting image {}", image.getName());
        currentSession().delete(image);
    }
    
}
