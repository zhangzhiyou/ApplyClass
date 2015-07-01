package Model;

import Dao.Treeloginsubmitdao;
import Email.MailSenderInfo;
import Email.SendEmail;
import Email.SimpleMailSender;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zhiyou on 15-4-25.
 */
@WebServlet(urlPatterns = "/loging4", name = "Login4")
public class Threeloginsubmit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF8");
        String txt;
        String name3 = request.getParameter("name2");
      //  String number3 = request.getParameter("number2");
        String reason = request.getParameter("reason");
        String temail = request.getParameter("email");
        String classroom = request.getParameter("classroom");
        String applytime = request.getParameter("applytimet");
        Integer classnumber = Integer.valueOf(classroom);//将字符串强制转换成int类型
        txt = name3+"申请教室请审核";
        try{
            if(Treeloginsubmitdao.choosecorrect(name3,classroom,applytime)>0){
                request.setAttribute("error","该同学不能重复申请");
                request.getRequestDispatcher("Threeloginout.jsp").forward(request,response);
                return;
            }
            else {
                Treeloginsubmitdao.inster2(name3, reason, classnumber, applytime,temail);
                SendEmail sendEmail = new SendEmail();
                sendEmail.send(name3,classroom,applytime);
//                MailSenderInfo mailInfo = new MailSenderInfo();
//                mailInfo.setMailServerHost("smtp.163.com");
//                mailInfo.setMailServerPort("25");
//                mailInfo.setValidate(true);
//                mailInfo.setUserName("18753377270@163.com");//三号楼老师的邮箱
//                mailInfo.setPassword("zhang192819");//三号楼老师的邮箱密码
//                mailInfo.setFromAddress("18753377270@163.com");//发邮件的邮箱地址
//                mailInfo.setToAddress("858667680@qq.com");//接受邮箱的邮箱地址
//                mailInfo.setSubject("老师审核教室");
//                mailInfo.setContent(name3+"想申请"+classroom+"教室  申请使用教室的时间"+applytime);
                //这个类主要来发送邮件
//                SimpleMailSender sms = new SimpleMailSender();
//                sms.sendTextMail(mailInfo);//发送文体格式
              //  sms.sendHtmlMail(mailInfo);//发送html格式
                request.getRequestDispatcher("Threeloginout.jsp").forward(request, response);

            }

        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
