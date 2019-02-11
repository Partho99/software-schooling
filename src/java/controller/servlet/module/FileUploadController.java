package controller.servlet.module;

import connection.jdbc.module.RegistrationLoginDB;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import pojo.java.module.ProfileImage;

/**
 *
 * @author partho
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100)
public class FileUploadController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RegistrationLoginDB rlDB = new RegistrationLoginDB();

        ProfileImage userImage = new ProfileImage();

        
        final Part filePart = request.getPart("file");
        //System.out.println(filePart.getSize());

        if (filePart.getSize() != 0) {
            HttpSession session = request.getSession();
            int uId = (Integer) session.getAttribute("loginuserid");
            final String path = "/home/partho/NetBeansProjects/software-schooling/web/img/profile_picture/";

            String pathDb = "img/profile_picture/";
            String userpic = (String) session.getAttribute("loginusername");

            String profilePic = userpic + ".jpg";

            final String fileName = profilePic;

            String fullPath = pathDb + fileName;
            OutputStream out = null;
            InputStream fileContent = null;
            try {
                out = new FileOutputStream(new File(path + File.separator + fileName));
                fileContent = filePart.getInputStream();

                int read = 0;
                final byte[] bytes = new byte[1024];

                while ((read = fileContent.read(bytes)) != -1) {

                    out.write(bytes, 0, read);

                }

            } catch (FileNotFoundException e) {

                System.out.println(e);
            } finally {
                if (out != null) {
                    out.close();
                }
                if (fileContent != null) {
                    fileContent.close();
                }
            }

            userImage.setImageName(userpic);
            userImage.setImagePath(fullPath);
            userImage.setUserId(uId);

            if (rlDB.setUserProfileImage(userImage) == true) {

                session.setAttribute("loginuserid", uId);
                response.sendRedirect("personal_info.jsp");
            } else {

            }

        } else {
           response.sendRedirect("personal_info.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
