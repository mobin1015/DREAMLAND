/**
 * 작성자 : 고은정
 * 기능   : 직원등록
 * 이력   :
 *    1) 240524
 *        - preventDefault 완료
 *        - 정규식(이름, 이메일, 휴대전화)
 *    2) 240613
 *        - 이메일 중복체크 ajax 작성
 *        - 이름, 휴대전화, 이메일 체크 함수를 oninput="함수이름()" 으로 호출 방식 변경
 *        - 생년월일 : 2000-01-01, 입사일 : 오늘날짜로 변경
 */

'use strict';

/************************** 변수 설정 **************************/
var emailCheck = false;
var nameCheck = false;
var mobileCheck = false;

var deptNo = 0;
var posNo = 0;
var role = 0;
var checkCount = 0;

var deptDetailOptions;

/************************** 함수 정의 **************************/
// 세부부서 가져오기
$(document).ready(function() {
  let today = new Date();
  let todayValue = today.toISOString().substring(0,10);
  $('#enter-date').attr('value', todayValue);
  
  $('#dept-no').change(function() {
    var selectedValue = $(this).val();
    if (selectedValue == '5000') {
      $('#dept-no').attr('name', 'deptDetailNo');
      $('#dept-detail-no').attr('name', 'deptNo');
      
      $.ajax({
        url: '/employee/detailDepart.do', 
        type: 'GET',
        success: (response) => { 
          deptDetailOptions = response.departDetailList; // 세부 부서 결과 저장
          var $deptDetailSelect = $('#dept-detail-no');
          $deptDetailSelect.empty(); // 기존 옵션들을 모두 제거
          $.each(deptDetailOptions, (index, deptDetailList) => {
            $deptDetailSelect.append(
                $('<option></option>').val(deptDetailList.deptNo).text(deptDetailList.deptName + '[' + deptDetailList.deptNo + ']')
            );
          });
        }
      });
    } else {
      $('#dept-no').attr('name', 'deptNo');
      $('#dept-detail-no').attr('name', 'deptDetailNo');
      $('#dept-detail-no').empty()
      }
  });
});

// 프로필 사진 등록 함수
document.addEventListener('DOMContentLoaded', function (e) {
  (function () {
    const deactivateAcc = document.querySelector('#formAccountDeactivation');

    // Update/reset user image of account page
    let accountUserImage = document.getElementById('uploadedAvatar');
    const fileInput = document.querySelector('.account-file-input'),
      resetFileInput = document.querySelector('.account-image-reset');

    if (accountUserImage) {
      const resetImage = accountUserImage.src;
      fileInput.onchange = () => {
        if (fileInput.files[0]) {
          accountUserImage.src = window.URL.createObjectURL(fileInput.files[0]);
        }
      };
      resetFileInput.onclick = () => {
        fileInput.value = '';
        accountUserImage.src = resetImage;
      };
    }

  })();
});

// 이름 체크 함수
const fnCheckName = () => {
  let inpName = document.getElementById('emp-name');
  let name = inpName.value;
  let totalByte = 0;
  let msgName = document.getElementById('name-result');
  let regName = /^[가-힣a-zA-Z]+$/;
  
  // 글자수 -> byte 계산
  for(let i = 0; i < name.length; i++){
    if(name.charCodeAt(i) > 127) {  // 코드값이 127 초과이면 한 글자 당 2바이트 처리한다.
      totalByte += 2;
    } else {
      totalByte++;
    }
  }

  nameCheck = (totalByte <= 20);

  // 공백 및 byte 초과 체크
  if(totalByte === 0){
    nameCheck = false;
    msgName.innerHTML = '이름은 공백일 수 없습니다';
    msgName.style.fontSize = '0.75rem';
    msgName.style.fontWeight = 'bold';
    msgName.style.color = '#EE2B4B';
  } else if(!nameCheck){
      nameCheck = false;
      msgName.innerHTML = '이름은 20 바이트를 초과할 수 없습니다.';
      msgName.style.fontSize = '0.75rem';
      msgName.style.fontWeight = 'bold';
      msgName.style.color = '#EE2B4B';
  } else if(!regName.test(name)) {
      nameCheck = false;
      msgName.innerHTML = '이름은 숫자와 특수문자가 포함될 수 없습니다.';
      msgName.style.fontSize = '0.75rem';
      msgName.style.fontWeight = 'bold';
      msgName.style.color = '#EE2B4B';
  } else {
    nameCheck = true;
    msgName.innerHTML = '';
  }

}

// 휴대전화 체크 함수
const fnCheckMobile = () => {
  let inpMobile = document.getElementById('emp-mobile');
  let msgMobile = document.getElementById('result-mobile');
  let regMobile = /^01[0-1,6-9]-\d{4}-\d{4}$/;
  
  if(inpMobile.value.length === 0){
    mobileCheck = false;
    msgMobile.innerHTML = '휴대전화는 공백일 수 없습니다';
    msgMobile.style.fontSize = '0.75rem';
    msgMobile.style.fontWeight = 'bold';
    msgMobile.style.color = '#EE2B4B';
  } else if(!regMobile.test(inpMobile.value)){
    mobileCheck = false;
    msgMobile.innerHTML = '전화번호 양식을 확인해주세요';
    msgMobile.style.fontSize = '0.75rem';
    msgMobile.style.fontWeight = 'bold';
    msgMobile.style.color = '#EE2B4B';
  } else {
    mobileCheck = true;
    msgMobile.innerHTML = '';
  }
}

// 이메일 체크 함수
const fnCheckEmail = () => {
  
  let inpEmail = document.getElementById('emp-email');
  let msgEmail = document.getElementById('result-email');
  let regEmail = /^[A-Za-z0-9-_]{2,}@[A-Za-z0-9]+(\.[A-Za-z]{2,6}){1,2}$/;
  
  if(inpEmail.value.length === 0){
    emailCheck = false;
    msgEmail.innerHTML = '이메일은 공백일 수 없습니다';
    msgEmail.style.fontSize = '0.75rem';
    msgEmail.style.fontWeight = 'bold';
    msgEmail.style.color = '#EE2B4B';
  } else if(!regEmail.test(inpEmail.value)){
    emailCheck = false;
    msgEmail.innerHTML = '이메일 양식을 확인해주세요';
    msgEmail.style.fontSize = '0.75rem';
    msgEmail.style.fontWeight = 'bold';
    msgEmail.style.color = '#EE2B4B';
  } else {
    emailCheck = true;
    msgEmail.innerHTML = '';
  }
  
  var email = inpEmail.value;
  $.ajax({
    url:'/employee/emailCheck.do',
    type: 'POST',
    data: {email:email},
    success: (response)=>{
      checkCount = response.checkCount;
      if(checkCount === 1){
          msgEmail.innerHTML = '중복된 이메일입니다. 다시 확인해주세요';
          msgEmail.style.fontSize = '0.75rem';
          msgEmail.style.fontWeight = 'bold';
          msgEmail.style.color = '#EE2B4B';
          return;
      } else{
      }
    }
    
  })
}

// 비밀번호 자동 생성 함수
let beforeBirth = document.getElementById('birth').value;

const fnGetPassword = () => {
  let currentBirth = document.getElementById('birth').value;
  
  if(beforeBirth !== currentBirth){
    const [year, month, day] = currentBirth.split('-');
    const shortYear = year.slice(2);
    const shortMonth = month.padStart(2, '0');
    const shortDay = day.padStart(2, '0');
    
    let password = shortYear + shortMonth + shortDay;
    document.getElementById('empPw').value = password;
  }
}

// preventDefault 부분
const fnAddEmployee = () =>{
  document.getElementById('frm-add-employee').addEventListener('submit', (evt)=>{
    if(!nameCheck){
      alert('이름을 확인하세요.');
      evt.preventDefault();
      return;
    } else if(!emailCheck){
      alert('이메일을 확인하세요.');
      evt.preventDefault();
      return;      
    } else if(!mobileCheck){
      alert('휴대전화를 확인하세요.');
      evt.preventDefault();
      return;
    } else if(deptNo === ''){
      alert('부서를 확인하세요.');
      evt.preventDefault();
      return;
    } else if(posNo === ''){
      alert('직급을 확인하세요.');
      evt.preventDefault();
      return;
    }else if(role === ''){
      alert('권한을 확인하세요.');
      evt.preventDefault();
      return;
    }else if(checkCount === 1){
      alert('이메일은 중복일 수 없습니다. 다시 확인하세요.');
      evt.preventDefault();
      return;
    }
    
  });

}


/************************** 함수 호출 **************************/
document.getElementById('birth').addEventListener('blur', fnGetPassword);

document.getElementById('dept-no').addEventListener('change', ()=>{
  deptNo = document.getElementById('dept-no').value;
});
document.getElementById('pos-no').addEventListener('change', ()=>{
  posNo = document.getElementById('pos-no').value;
});
document.getElementById('role').addEventListener('change', ()=>{
  role = document.getElementById('role').value;
});

document.getElementById('move-before').addEventListener('click', ()=>{
  window.history.back();
})

fnAddEmployee();

