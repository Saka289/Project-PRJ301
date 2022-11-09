/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function setCheck(obj) {
    var fries = document.getElementsByName('cidd');
    var fries1 = document.getElementsByName('price')
    if ((obj.id == 'c0') && (fries[0].checked == true))
    {
        for (var i = 1; i < fries.length; i++)
            fries[i].checked = false;
    } else {
        for (var i = 1; i < fries.length; i++) {
            if (fries[i].checked == true) {
                fries[0].checked = false;
                break;
            }
            if (fries[i].checked == false) {
                fries[0].checked = true;
            }
        }
    }
    if ((obj.id == 'c0') && (fries[0].checked == true)) {
        for (var i = 0; i < fries1.length; i++)
            fries1[i].checked = false;
    } else {
        for (var i = 0; i < fries1.length; i++) {
            if (fries1[i].checked == true) {
//                fries1[0].checked = true;
                break;
            }
        }
    }
    document.getElementById('f1').submit();
}

function setCheck2(obj) {
    var fries = document.getElementsByName('brand');
    if ((obj.id == 'b0') && (fries[0].checked == true))
    {
        for (var i = 1; i < fries.length; i++)
            fries[i].checked = false;
    } else {
        for (var i = 1; i < fries.length; i++) {
            if (fries[i].checked == true) {
                fries[0].checked = false;
                break;
            }
        }
    }
    document.getElementById('f3').submit();
}