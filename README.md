# LOL Info App
리그오브 레전드 챔피언 정보 제공앱

# 사용 아키텍쳐 (MVVM With Clean Architecture)

![스크린샷 2024-02-18 오후 7 56 02](https://github.com/f-lab-edu/LOL_Info_App/assets/93653997/b1a09dbd-d432-4785-88d8-6da7a2f82035)

## Presentation Layer
- Coordinator
   
화면의 이동을 담당
- View(ViewController)
    
UI를 담당 (레이아웃, 사용자이벤트)
- ViewModel
    
View의 상태 관리를 담당 (View의 이벤트 발생에대해서 무엇을하고 View를 어떻게 업데이트 할지)
   
## Domain Layer
- UseCase
    
비즈니스 로직을 담당
- Entity
     
화면의 보여질 형태의 데이터를 담당

## Data Layer
- Repository
      
서버나 DB로 데이터 요청을 담당
- DTO (Data Transfer Object)
      
서버나 DB로 부터 받아온 데이터의 처리를 담당 (데이터를 처리할 필요 없이 바로 사용 가능한 데이터인경우 생략 가능)

# 구현 화면 정리

## 챔피언 메인 화면
<img width="250" alt="스크린샷 2024-02-06 오후 9 54 04" src="https://github.com/f-lab-edu/LOL_Info_App/assets/93653997/9822b8bb-2884-4d35-b5e5-e06010aa32de">


### 챔피언 검색
- 챔피언 이름으로 검색 후 하단에 필터 후 리스팅 기능
- 리스트에서 해당 영역 클릭시 챔피언 상세화면으로 진입

### 즐겨찾기 챔피언 모아보기
- 내가 즐겨찾기한 챔피언만 가로 리스트로 모아보기 기능

### 역할군별 리스트 필터
- 역할군 별로 검색한 챔피언 리스트를 필터해서 볼 수 있는 기능

## 챔피언 상세 화면
<img width="250" alt="스크린샷 2024-02-06 오후 9 54 04" src="https://github.com/f-lab-edu/LOL_Info_App/assets/93653997/2fa7ce37-38e3-41ad-bc77-3332e3d474de">

### 챔피언 상세 설명
- 최상단에 랜덤한 스킨 이미지 표시
- 각 스킬 해당 키와 스킬 이미지 표시
- 스토리 텍스트 표시
- 사용법 및 상대법 텍스트 표시

### 즐겨찾기
- 메인화면에서 리스팅되는 즐겨찾기 추가 및 해제 버튼 기능
- 즐겨찾기는 로그인시에만 이용 가능하도록 구현 비로그인시에 해당 버튼 클릭시 로그인 유도 Alert 노출

## 비로그인시 설정화면
<img width="250" alt="스크린샷 2024-02-06 오후 9 54 04" src="https://github.com/f-lab-edu/LOL_Info_App/assets/93653997/6a2685c8-dcb7-48b0-b5af-476187ebcc59">

### 로그인 버튼
- 로그인 화면으로 진입할 수 있는 버튼 기능

## 로그인 화면 
<img width="250" alt="스크린샷 2024-02-06 오후 9 54 04" src="https://github.com/f-lab-edu/LOL_Info_App/assets/93653997/696275ce-8845-4029-b923-2bcfe611837d">

### SNS 로그인 
- 구글, 애플 2개의 SNS 로그인 기능

## 로그인시 설정화면
<img width="250" alt="스크린샷 2024-02-06 오후 9 54 04" src="https://github.com/f-lab-edu/LOL_Info_App/assets/93653997/570bd03a-06c0-4c15-8f20-d7c1d08cbbc">

### 프로필 이미지 및 닉네임
- 최상단에 프로필 이미지 및 닉네임 표시

### 챔피언 즐겨찾기 목록 버튼
- 챔피언 즐겨찾기 목록으로 진입할 수 있는 버튼 기능

### 로그아웃
- 로그아웃 기능

## 챔피언 즐겨찾기 목록 화면
<img width="250" alt="스크린샷 2024-02-06 오후 9 54 04" src="https://github.com/f-lab-edu/LOL_Info_App/assets/93653997/36ca77c7-5929-4659-abe8-2eb47e50fe34">

### 즐겨찾기
- 즐겨찾기한 챔피언들 모아보기 리스팅 기능
- 리스트에서 즐겨찾기 해제 기능



