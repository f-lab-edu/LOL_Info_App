# LOL Info App
리그오브 레전드 챔피언 정보 제공앱

## 사용 아키텍쳐 (MVVM With Clean Architecture)
<img width="800" alt="스크린샷 2024-02-19 오후 8 15 12" src="https://github.com/f-lab-edu/LOL_Info_App/assets/93653997/0929cb3e-fda9-4c8c-a59d-017d05704157">

### Presentation Layer
#### Coordinator 
화면의 이동을 담당
    
#### View(ViewController) 
UI를 담당 (레이아웃, 사용자이벤트)
   
#### ViewModel
화면에 보여질 데이터 (Presentation Layer 데이터 매핑 객체)
    
#### Presenter
View의 이벤트를 받고 View를 업데이트하는 등의 View의 상태관리
       
### Domain Layer
#### UseCase
비즈니스 로직을 담당
    
#### Entity
비즈니스 핵심 모델 (Domain Layer 데이터 매핑 객체)
      
### Data Layer
#### Repository  
서버나 DB로 데이터 요청을 담당
     
#### DTO (Data Transfer Object)      
서버나 DB로 부터 받은 데이털르 매핑한 객체 (Data Layer 데이터 매핑 객체)

### 중요 규칙
#### 의존관계 역전 원칙
고레벨 모듈이 저레벨 모듈을 사용해야하는경우 Protocol을 이용해 의존성을 주입시켜 의존성 역전 원칙을 지킨다. (Usecase가 Reposiotory를 사용할떄)
물론 의존성역전 원칙을 지킬때 뿐만 아니라 testable한 코드를 만들기 위해 사용해도 무관핟.

#### 데이터 매핑
각 계층에서 데이터를 주고 받을땐 항상 각계층에 맞는 데이터로 매핑해서 주고 받는다.

## 구현 화면 정리

### 챔피언 메인 화면
<img width="250" alt="스크린샷 2024-02-06 오후 9 54 04" src="https://github.com/f-lab-edu/LOL_Info_App/assets/93653997/9822b8bb-2884-4d35-b5e5-e06010aa32de">


#### 챔피언 검색
- 챔피언 이름으로 검색 후 하단에 필터 후 리스팅 기능
- 리스트에서 해당 영역 클릭시 챔피언 상세화면으로 진입

#### 즐겨찾기 챔피언 모아보기
- 내가 즐겨찾기한 챔피언만 가로 리스트로 모아보기 기능

#### 역할군별 리스트 필터
- 역할군 별로 검색한 챔피언 리스트를 필터해서 볼 수 있는 기능

### 챔피언 상세 화면
<img width="250" alt="스크린샷 2024-02-06 오후 9 54 04" src="https://github.com/f-lab-edu/LOL_Info_App/assets/93653997/2fa7ce37-38e3-41ad-bc77-3332e3d474de">

#### 챔피언 상세 설명
- 최상단에 랜덤한 스킨 이미지 표시
- 각 스킬 해당 키와 스킬 이미지 표시
- 스토리 텍스트 표시
- 사용법 및 상대법 텍스트 표시

#### 즐겨찾기
- 메인화면에서 리스팅되는 즐겨찾기 추가 및 해제 버튼 기능
- 즐겨찾기는 로그인시에만 이용 가능하도록 구현 비로그인시에 해당 버튼 클릭시 로그인 유도 Alert 노출

### 비로그인시 설정화면
<img width="250" alt="스크린샷 2024-02-06 오후 9 54 04" src="https://github.com/f-lab-edu/LOL_Info_App/assets/93653997/6a2685c8-dcb7-48b0-b5af-476187ebcc59">

#### 로그인 버튼
- 로그인 화면으로 진입할 수 있는 버튼 기능

### 로그인 화면 
<img width="250" alt="스크린샷 2024-02-06 오후 9 54 04" src="https://github.com/f-lab-edu/LOL_Info_App/assets/93653997/696275ce-8845-4029-b923-2bcfe611837d">

#### SNS 로그인 
- 구글, 애플 2개의 SNS 로그인 기능

### 로그인시 설정화면
<img width="250" alt="스크린샷 2024-02-06 오후 9 54 04" src="https://github.com/f-lab-edu/LOL_Info_App/assets/93653997/570bd03a-06c0-4c15-8f20-d7c1d08cbbc">

#### 프로필 이미지 및 닉네임
- 최상단에 프로필 이미지 및 닉네임 표시

#### 챔피언 즐겨찾기 목록 버튼
- 챔피언 즐겨찾기 목록으로 진입할 수 있는 버튼 기능

#### 로그아웃
- 로그아웃 기능

### 챔피언 즐겨찾기 목록 화면
<img width="250" alt="스크린샷 2024-02-06 오후 9 54 04" src="https://github.com/f-lab-edu/LOL_Info_App/assets/93653997/36ca77c7-5929-4659-abe8-2eb47e50fe34">

#### 즐겨찾기
- 즐겨찾기한 챔피언들 모아보기 리스팅 기능
- 리스트에서 즐겨찾기 해제 기능



