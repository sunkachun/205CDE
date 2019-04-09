from flask import Flask, render_template, redirect,url_for, request, session,escape
from flask_bootstrap import Bootstrap

import pymysql

app = Flask(__name__)


app.secret_key = "Any string"

db = pymysql.connect(host="localhost",user="sunkachun",password="pp548912",db="sunkachun")


@app.route("/",methods = ["GET","POST"])
def index():
    if "username" in session:
        return ("Logged in as "+session["username"]+"<br>")
    else:
        return render_template("assgin.html")


@app.route("/signup", methods = ["GET","POST"])
def signup():
    error =None
    if request.method == "POST":
        mail = request.form["email"]
        pwd = request.form["password"]
        usrname = request.form["username"]
        age = str(request.form["age"])

        cursor=db.cursor()
        sql="INSERT INTO `signin`( `email`, `userpassword`, `username`, `age`) VALUES (%s,%s,%s,%s)" 

        cursor.execute(sql, (mail,pwd,usrname,age))
        db.commit()
        
        sql2 = "SELECT `userid` FROM `signin` WHERE `email`=(%s)"
        cursor.execute(sql2, (mail))
        data= cursor.fetchone()
        db.close()
    return render_template("index.html",error= error, userid= data[0])

@app.route("/login", methods = ["GET","POST"])
def login():
    error = None
    if request.method == 'POST':
        session.pop=("id", None)
        userid = str(request.form["userid"])
        htmlpwd = str(request.form["password2"])

        cursor=db.cursor()

        sql ="SELECT `userid`,`email`, `userpassword`,`username`,`age` FROM `signin` WHERE `userid`=(%s)"
        cursor.execute(sql, (userid))

        db.commit()

        results = cursor.fetchone()

        if htmlpwd == str(results[2]):
            session['id'] = results[3]
            return render_template("userif.html", age=results[4], email=results[1], username=results[3])
        return redirect(url_for('index'))
    return redirect(url_for('index'))
   

@app.route("/forgot", methods = ["GET","POST"])
def forgot():
    error = None
    if request.method == 'POST':
        session.pop=("id", None)
        userid = request.form["fgid"]
        useremail = request.form["fgemail"]
        username = request.form["fgusername"]

        cursor=db.cursor()

        sql ="SELECT `userid`,`email`, `userpassword`,`username`,`age` FROM `signin` WHERE `userid`=(%s)"
        cursor.execute(sql, (userid))

        db.commit()

        results = cursor.fetchone()

        if useremail == str(results[1]) and username == str(results[3]):
            session['id'] = results[3]
            return render_template("forgot.html", userid=results[0], pwd=results[2])
        return redirect(url_for('index'))
    return redirect(url_for('index'))
   
@app.route("/comment", methods = ["GET","POST"])
def comment():
    error =None
    if request.method == "POST":
        bookid = str(request.form["bkid"])
        comment = request.form["comment"]
        userid = str(request.form["useridcomment"])

        cursor=db.cursor()
        sql="INSERT INTO `bookcomment`( `comment`, `bookid`, `userid`) VALUES (%s,%s,%s)" 

        cursor.execute(sql, (comment,bookid,userid))
        db.commit()
        

    return render_template("success.html",error= error, comment=comment,bkid=bookid)

@app.route("/showcomment")
def showcomment():
    error =None
    if 'id' in session:
        cursor=db.cursor()
        sql ="SELECT `bookcomment`.`bookid`,`bookcomment`.`comment`,`bookcomment`.`userid`,`bookif`.`bookname` FROM `bookcomment` INNER JOIN `bookif` ON `bookcomment`.`bookid`=`bookif`.`bookid`"
        cursor.execute(sql)
        db.commit()
        data=cursor.fetchall()

    return render_template("comment.html",error= error, data=data)


@app.route("/upload", methods = ["GET","POST"])
def upload():
    error =None
    if request.method == "POST":
        content = request.form["content"]
        userid = request.form["useridupload"]

        cursor=db.cursor()
        sql="INSERT INTO `article`( `content`, `userid`) VALUES (%s,%s)" 

        cursor.execute(sql, (content,userid))
        db.commit()

        sql2 = "SELECT `artid`,`content`,`userid` FROM `article` WHERE `userid`=(%s)"
        cursor.execute(sql2, (userid))
        data= cursor.fetchone()
        db.close()
    return render_template("article.html",error= error, content=data[1],userid=userid,artid=data[0])

'''
@app.route("/showbookname")
def showbookname():
    error = None
    if request.method == 'POST':
        
        cursor=db.cursor()

        sql ="SELECT `userid`,`email`, `userpassword`,`username`,`age` FROM `signinif` WHERE `userid`=(%s)"
        cursor.execute(sql, (userid))

        db.commit()

        results = cursor.fetchone()

        if htmlpwd == str(results[2]):
            session['id'] = results[3]
            return render_template("userif.html", age=results[4], email=results[1], username=results[3])
        return redirect(url_for('index'))
    return redirect(url_for('index'))
'''

@app.route("/science")
def science():
    return render_template("science.html")

@app.route("/lightnovel")
def lightnovel():
    return render_template("lightnovel.html")

@app.route("/martialart")
def martialart():
    return render_template("martialart.html")

@app.route("/homemade")
def homemade():
    return render_template("homemade.html")

@app.route("/article")
def article():
    return render_template("article.html")

@app.route("/clicklogin")
def clicklogin():
    return render_template("assgin.html")

@app.route("/gocomment")
def gocomment():
    return render_template("comment.html")
 
if __name__ == "__main__":
    app.debug=True
    app.run()
