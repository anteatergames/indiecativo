�

eC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Attributes\UiInfo.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #

Attributes# -
{ 
[ 
AttributeUsage 
( 
AttributeTargets $
.$ %
Field% *
)* +
]+ ,
public 

class 
UiInfoAttribute  
:! "
	Attribute# ,
{		 
public

 
int

 
Order

 
{

 
get

 
;

 
set

  #
;

# $
}

% &
public 
string 
Class 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Culture 
{ 
get  #
;# $
set% (
;( )
}* +
public
string
Description
{
get
;
set
;
}
public 
string 
Display 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} �
cC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Enums\BadgeType.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Enums# (
{ 
public 

enum 
	BadgeType 
{ 
[ 	
UiInfo	 
( 
Order 
= 
$num 
, 
Display "
=# $
$str% 2
,2 3
Description4 ?
=@ A
$strB u
)u v
]v w

BetaTester 
= 
$num 
, 
[

 	
UiInfo

	 
(

 
Order

 
=

 
$num

 
,

 
Display

 "
=

# $
$str

% 0
,

0 1
Description

2 =
=

> ?
$str

@ S
)

S T
]

T U
LovedOne 
= 
$num 
, 
[
UiInfo
(
Order
=
$num
,
Display
=
$str
,
Description
=
$str
)
]
ConversationStarter 
= 
$num 
,  
[ 	
UiInfo	 
( 
Order 
= 
$num 
, 
Display "
=# $
$str% 0
,0 1
Description2 =
=> ?
$str@ X
)X Y
]Y Z
	Talkative 
= 
$num 
, 
[ 	
UiInfo	 
( 
Order 
= 
$num 
, 
Display "
=# $
$str% -
,- .
Description/ :
=; <
$str= M
)M N
]N O
Helper 
= 
$num 
, 
[ 	
UiInfo	 
( 
Order 
= 
$num 
, 
Display "
=# $
$str% .
,. /
Description0 ;
=< =
$str> a
)a b
]b c
JamFan 
= 
$num 
, 
[ 	
UiInfo	 
( 
Order 
= 
$num 
, 
Display "
=# $
$str% ,
,, -
Description. 9
=: ;
$str< O
)O P
]P Q
Admin 
= 
$num 
, 
[ 	
UiInfo	 
( 
Order 
= 
$num 
, 
Display "
=# $
$str% .
,. /
Description0 ;
=< =
$str> X
)X Y
]Y Z
Curator 
= 
$num 
} 
} �
bC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Enums\BlobType.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Enums# (
{ 
public 

enum 
BlobType 
{ 
ProfileImage		 
,		 
ProfileCover

 
,

 

, 
	GameCover 
, 
ContentImage
,

} 
} �
oC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Enums\BrainstormSessionType.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Enums# (
{ 
public 

enum !
BrainstormSessionType %
{ 
Main		 
=		
$num		 
,		 
Game

 
=


$num

 
,

 
Content 
= 
$num 
} 
}
fC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Enums\CodeLanguage.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Enums# (
{ 
public 

enum 
CodeLanguage 
{ 
Csharp		 
,		 
Java

 
,

 
	Cplusplus 
, 

Javascript 
}
} �
gC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Enums\ExternalLinks.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Enums# (
{ 
public 

enum 

{ 
Website		 	
=		
 
$num		 
,		
Facebook

 

=

 
$num


,

 
Twitter 	
=
 
$num 
,
	Instagram 
= 
$num 
, 

GooglePlus
=
$num
,
Youtube 	
=
 
$num 
,
XboxLive 

= 
$num
, 
Psn 
= 
$num 
, 
Steam 
= 
$num 
} 
} �
dC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Enums\FollowType.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Enums# (
{ 
public 

enum 

FollowType 
{ 
Content		 
=		 
$num		 
,		 
Game

 
=


$num

 
} 
} �
dC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Enums\GameEngine.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Enums# (
{ 
public 

enum 

GameEngine 
{ 
Unity		 
,		
Unreal

 
,

 
	GameMaker 
} 
}
cC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Enums\GameGenre.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Enums# (
{ 
public 

enum 
	GameGenre 
{		 
[

 	
UiInfo

	 
(

 
Class

 
=

 
$str

 
)

 
]

 
Strategy 
= 
$num 
, 
[ 	
UiInfo	 
( 
Class 
= 
$str 
) 
]  
Racing
=
$num
,
[ 	
UiInfo	 
( 
Class 
= 
$str  
)  !
]! "
Fighting 
= 
$num 
, 
[ 	
UiInfo	 
( 
Class 
= 
$str 
)  
]  !
	Adventure 
= 
$num 
, 
[ 	
UiInfo	 
( 
Class 
= 
$str 
) 
]  
Rpg 
= 
$num 
, 
[ 	
UiInfo	 
( 
Class 
= 
$str  
)  !
]! "
Action 
= 
$num 
, 
[ 	
UiInfo	 
( 
Class 
= 
$str 
) 
]  

Simulation 
= 
$num 
, 
[ 	
UiInfo	 
( 
Class 
= 
$str  
)  !
]! "
Sports 
= 
$num 
, 
[ 	
UiInfo	 
( 
Class 
= 
$str 
)  
]  !
Horror 
= 
$num 
, 
[ 	
UiInfo	 
( 
Class 
= 
$str 
) 
]  
	Roguelike 
= 
$num 
, 
[ 	
UiInfo	 
( 
Class 
= 
$str !
)! "
]" #
Casual 
= 
$num 
, 
[   	
UiInfo  	 
(   
Class   
=   
$str   
)   
]    
	ShootEmUp!! 
=!! 
$num!! 
,!! 
["" 	
UiInfo""	 
("" 
Class"" 
="" 
$str""  
)""  !
]""! "
BeatEmUp## 
=## 
$num## 
,## 
[$$ 	
UiInfo$$	 
($$ 
Class$$ 
=$$ 
$str$$ 
)$$ 
]$$  
MotionComics%% 
=%% 
$num%% 
}&& 
}'' �
gC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Enums\GamePlatforms.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Enums# (
{ 
public 

enum 

{		 
[

 	
UiInfo

	 
(

 
Class

 
=

 
$str

 !
)

! "
]

" #
Windows 
, 
[ 	
UiInfo	 
( 
Class 
= 
$str 
)  
]  !
Linux
,
[ 	
UiInfo	 
( 
Class 
= 
$str 
) 
]  
Xbox 
, 
[ 	
UiInfo	 
( 
Class 
= 
$str %
)% &
]& '
Playstation 
, 
[ 	
UiInfo	 
( 
Class 
= 
$str )
)) *
]* +
NintendoSwitch 
, 
[ 	
UiInfo	 
( 
Class 
= 
$str !
)! "
]" #
Android 
, 
[ 	
UiInfo	 
( 
Class 
= 
$str 
) 
] 
Ios 
, 
[ 	
UiInfo	 
( 
Class 
= 
$str 
)  
]  !
Steam 
} 
} �
dC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Enums\GameStatus.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Enums# (
{ 
public 

enum 

GameStatus 
{ 
Planed		 
,		 
Concept

 
,

 
Released 
, 
Alpha 
,
Beta
,
	Cancelled 
} 
} �
hC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Enums\LikeTargetType.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Enums# (
{ 
public 

enum 
LikeTargetType 
{ 
UserContent		 
,		 
Game

 
,

 
User 
} 
}
cC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Enums\MediaType.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Enums# (
{ 
public 

enum 
	MediaType 
{ 
None		 
=		
$num		 
,		 
Image

 
=

 
$num

 
,

 
Video 
= 
$num 
, 
Youtube 
= 
$num 
}
} �
jC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Enums\NotificationType.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Enums# (
{ 
public 

enum 
NotificationType  
{ 
ContentLike		 
=		 
$num		 
,		 
GameLike

 
=

 
$num

 
,

 
ContentComment 
= 
$num 
, 
ConnectionRequest 
= 
$num 
, 
	FollowYou
=
$num
,
FollowYourGame 
= 
$num 
, 
AchivementEarned 
= 
$num 
, 
LevelUp 
= 
$num 
,  
ArticleAboutYourGame 
= 
$num  
,  !

= 
$num 
} 
} �
hC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Enums\PlatformAction.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Enums# (
{ 
public 

enum 
PlatformAction 
{ 

SimplePost		 
=		 
$num		 
,		 
ComplexPost

 
=

 
$num

 
,

 
GameAdd 
= 
$num 
, 

= 
$num 
, 
IdeaImplemented
=
$num
,
PopularPost 
= 
$num 
, 
PostFeatured 
= 
$num 
, 
GameFeatured 
= 
$num 
} 
} �
eC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Enums\ProfileType.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Enums# (
{ 
public 

enum 
ProfileType 
{ 
Personal		 
=		 
$num		 
,		 
Studio

 
=

 
$num

 
} 
} �
_C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Enums\Roles.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Enums# (
{ 
public 

enum 
Roles 
{ 

,		 
Curator

 
,

 
Editor 
, 
Member 
}
} �
kC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Enums\SupportedLanguage.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Enums# (
{ 
public 

enum 
SupportedLanguage !
{		 
[

 	
UiInfo

	 
(

 
Culture

 
=

 
$str

 
)

  
]

  !
English 
= 
$num 
, 
[ 	
UiInfo	 
( 
Culture 
= 
$str !
)! "
]" #

Portuguese
=
$num
,
[ 	
UiInfo	 
( 
Culture 
= 
$str !
)! "
]" #
Russian 
= 
$num 
, 
[ 	
UiInfo	 
( 
Culture 
= 
$str 
) 
]  
Spanish 
= 
$num 
, 
[ 	
UiInfo	 
( 
Culture 
= 
$str 
) 
]  
Bosnian 
= 
$num 
, 
[ 	
UiInfo	 
( 
Culture 
= 
$str 
) 
]  
Serbian 
= 
$num 
, 
[ 	
UiInfo	 
( 
Culture 
= 
$str 
) 
]  
Croatian 
= 
$num 
, 
[ 	
UiInfo	 
( 
Culture 
= 
$str 
) 
]  
German 
= 
$num 
} 
} �
iC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Enums\UserContentType.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Enums# (
{ 
public 

enum 
UserContentType 
{ 
Post		 
=		
$num		 
,		 

VotingItem

 
=

 
$num

 
} 
} �
cC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Enums\VoteValue.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Enums# (
{ 
public 

enum 
	VoteValue 
{ 
Neutral		 
=		 
$num		 
,		 
Positive

 
=

 
$num

 
,

 
Negative 
= 
- 
$num 
} 
}
mC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Extensions\EnumExtensions.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #

Extensions# -
{ 
public 

static 
class 
EnumExtensions &
{ 
public 
static 
T 
GetAttributeOfType *
<* +
T+ ,
>, -
(- .
this. 2
Enum3 7
enumVal8 ?
)? @
whereA F
TG H
:I J
SystemK Q
.Q R
	AttributeR [
{ 	
var 
type 
= 
enumVal 
. 
GetType &
(& '
)' (
;( )
var 
memInfo 
= 
type 
. 
	GetMember (
(( )
enumVal) 0
.0 1
ToString1 9
(9 :
): ;
); <
;< =
var 

attributes 
= 
memInfo $
[$ %
$num% &
]& '
.' (
GetCustomAttributes( ;
(; <
typeof< B
(B C
TC D
)D E
,E F
falseG L
)L M
;M N
return 
( 

attributes 
. 
Length %
>& '
$num( )
)) *
?+ ,
(- .
T. /
)/ 0

attributes0 :
[: ;
$num; <
]< =
:> ?
null@ D
;D E
} 	
} 
} �!
aC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Models\Entity.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Models# )
{ 
public		 

class		 
Entity		 
{

 
[ 	
Key	 
, 
Column 
( 
Order 
= 
$num 
) 
]  
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
[ 	
Column	 
( 
Order 
= 
$num 
) 
] 
public 
Guid 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
public 
DateTime 

CreateDate "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
override 
bool 
Equals #
(# $
object$ *
obj+ .
). /
{ 	
var 
	compareTo 
= 
obj 
as  "
Entity# )
;) *
if 
( 
ReferenceEquals 
(  
this  $
,$ %
	compareTo& /
)/ 0
)0 1
return2 8
true9 =
;= >
if 
( 
ReferenceEquals 
(  
null  $
,$ %
	compareTo& /
)/ 0
)0 1
return2 8
false9 >
;> ?
return 
Id 
. 
Equals 
( 
	compareTo &
.& '
Id' )
)) *
;* +
} 	
public 
static 
bool 
operator #
==$ &
(& '
Entity' -
a. /
,/ 0
Entity1 7
b8 9
)9 :
{ 	
if 
( 
ReferenceEquals 
(  
a  !
,! "
null# '
)' (
&&) +
ReferenceEquals, ;
(; <
b< =
,= >
null? C
)C D
)D E
return   
true   
;   
if"" 
("" 
ReferenceEquals"" 
(""  
a""  !
,""! "
null""# '
)""' (
||"") +
ReferenceEquals"", ;
(""; <
b""< =
,""= >
null""? C
)""C D
)""D E
return## 
false## 
;## 
return%% 
a%% 
.%% 
Equals%% 
(%% 
b%% 
)%% 
;%% 
}&& 	
public(( 
static(( 
bool(( 
operator(( #
!=(($ &
(((& '
Entity((' -
a((. /
,((/ 0
Entity((1 7
b((8 9
)((9 :
{)) 	
return** 
!** 
(** 
a** 
==** 
b** 
)** 
;** 
}++ 	
public-- 
override-- 
int-- 
GetHashCode-- '
(--' (
)--( )
{.. 	
return// 
(// 
GetType// 
(// 
)// 
.// 
GetHashCode// )
(//) *
)//* +
*//, -
$num//. 1
)//1 2
+//3 4
Id//5 7
.//7 8
GetHashCode//8 C
(//C D
)//D E
;//E F
}00 	
public22 
override22 
string22 
ToString22 '
(22' (
)22( )
{33 	
return44 
GetType44 
(44 
)44 
.44 
Name44 !
+44" #
$str44$ +
+44, -
Id44. 0
+441 2
$str443 6
;446 7
}55 	
}66 
}77 �	
iC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Domain.Core\Models\ExternalEntity.cs
	namespace 	
IndieVisible
 
. 
Domain 
. 
Core "
." #
Models# )
{ 
public 

abstract 
class 
ExternalEntity (
:) *
Entity+ 1
{		 
public 
string 
GameJoltUrl !
{" #
get$ '
;' (
set) ,
;, -
}. /
public
string
	ItchIoUrl
{
get
;
set
;
}
public 
string 

IndieDbUrl  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 

{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
UnityConnectUrl %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} 