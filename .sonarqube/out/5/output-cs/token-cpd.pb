�
oC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\AutoMapper\AutoMapperConfig.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

AutoMapper# -
{ 
public 

class 
AutoMapperConfig !
{		 
public

 
static

 
MapperConfiguration

 )
RegisterMappings

* :
(

: ;
)

; <
{ 	
return 
new 
MapperConfiguration *
(* +
cfg+ .
=>/ 1
{ 
cfg 
. 

AddProfile 
( 
new "+
DomainToViewModelMappingProfile# B
(B C
)C D
)D E
;E F
cfg 
. 

AddProfile 
( 
new "+
ViewModelToDomainMappingProfile# B
(B C
)C D
)D E
;E F
} 
) 
; 
} 	
} 
} �4
~C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\AutoMapper\DomainToViewModelMappingProfile.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

AutoMapper# -
{ 
internal 
class +
DomainToViewModelMappingProfile 2
:3 4
Profile5 <
{ 
public +
DomainToViewModelMappingProfile .
(. /
)/ 0
{ 	
	CreateMap 
< 
Game 
, 
SelectListItemVo ,
>, -
(- .
). /
. 
	ForMember 
( 
x  
=>! #
x$ %
.% &
Value& +
,+ ,
opt- 0
=>1 3
opt4 7
.7 8
MapFrom8 ?
(? @
x@ A
=>B D
xE F
.F G
IdG I
.I J
ToStringJ R
(R S
)S T
)T U
)U V
. 
	ForMember 
( 
x  
=>! #
x$ %
.% &
Text& *
,* +
opt, /
=>0 2
opt3 6
.6 7
MapFrom7 >
(> ?
x? @
=>A C
xD E
.E F
TitleF K
)K L
)L M
;M N
	CreateMap 
< 
FeaturedContent %
,% &$
FeaturedContentViewModel' ?
>? @
(@ A
)A B
;B C
	CreateMap 
< 
UserPreferences %
,% &$
UserPreferencesViewModel' ?
>? @
(@ A
)A B
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
	Languages( 1
,1 2
opt3 6
=>7 9
opt: =
.= >
ResolveUsing> J
<J K+
UserLanguagesFromDomainResolverK j
>j k
(k l
)l m
)m n
;n o
	CreateMap   
<   
Game   
,   
GameViewModel   )
>  ) *
(  * +
)  + ,
.!! 
	ForMember!! 
(!! 
dest!! #
=>!!$ &
dest!!' +
.!!+ ,

AuthorName!!, 6
,!!6 7
opt!!8 ;
=>!!< >
opt!!? B
.!!B C
MapFrom!!C J
(!!J K
src!!K N
=>!!O Q
src!!R U
.!!U V
DeveloperName!!V c
)!!c d
)!!d e
."" 
	ForMember"" 
("" 
dest"" #
=>""$ &
dest""' +
.""+ ,
	Platforms"", 5
,""5 6
opt""7 :
=>""; =
opt""> A
.""A B
ResolveUsing""B N
<""N O*
GamePlatformFromDomainResolver""O m
>""m n
(""n o
)""o p
)""p q
;""q r
	CreateMap## 
<## 
Game## 
,## !
GameListItemViewModel## 1
>##1 2
(##2 3
)##3 4
;##4 5
	CreateMap'' 
<'' 
UserProfile'' !
,''! "
ProfileViewModel''# 3
>''3 4
(''4 5
)''5 6
.(( 
	ForMember(( 
((( 
x((  
=>((! #
x(($ %
.((% &
Counters((& .
,((. /
opt((0 3
=>((4 6
opt((7 :
.((: ;
Ignore((; A
(((A B
)((B C
)((C D
.)) 
	ForMember)) 
()) 
x))  
=>))! #
x))$ %
.))% &
IndieXp))& -
,))- .
opt))/ 2
=>))3 5
opt))6 9
.))9 :
Ignore)): @
())@ A
)))A B
)))B C
.** 
	ForMember** 
(** 
x**  
=>**! #
x**$ %
.**% &
ExternalLinks**& 3
,**3 4
opt**5 8
=>**9 ;
opt**< ?
.**? @
Ignore**@ F
(**F G
)**G H
)**H I
;**I J
	CreateMap.. 
<.. 
UserContent.. !
,..! " 
UserContentViewModel..# 7
>..7 8
(..8 9
)..9 :
;..: ;
	CreateMap// 
<// 
UserContent// !
,//! "(
UserContentListItemViewModel//# ?
>//? @
(//@ A
)//A B
.00 
	ForMember00 
(00 
x00 
=>00 
x00  !
.00! "
	LikeCount00" +
,00+ ,
opt00- 0
=>001 3
opt004 7
.007 8
MapFrom008 ?
(00? @
x00@ A
=>00B D
x00E F
.00F G
Likes00G L
.00L M
Count00M R
(00R S
)00S T
)00T U
)00U V
;00V W
	CreateMap22 
<22 
UserContent22 !
,22! ",
 UserContentToBeFeaturedViewModel22# C
>22C D
(22D E
)22E F
;22F G
	CreateMap66 
<66 
BrainstormSession66 '
,66' (&
BrainstormSessionViewModel66) C
>66C D
(66D E
)66E F
;66F G
	CreateMap77 
<77 
BrainstormIdea77 $
,77$ %#
BrainstormIdeaViewModel77& =
>77= >
(77> ?
)77? @
;77@ A
	CreateMap88 
<88 
BrainstormVote88 $
,88$ %#
BrainstormVoteViewModel88& =
>88= >
(88> ?
)88? @
;88@ A
	CreateMap99 
<99 
BrainstormComment99 '
,99' (&
BrainstormCommentViewModel99) C
>99C D
(99D E
)99E F
;99F G
	CreateMap== 
<== 
	UserBadge== 
,==  
UserBadgeViewModel==! 3
>==3 4
(==4 5
)==5 6
;==6 7
	CreateMapAA 
<AA 

GameFollowAA  
,AA  !
GameFollowViewModelAA" 5
>AA5 6
(AA6 7
)AA7 8
;AA8 9
	CreateMapBB 
<BB 

UserFollowBB  
,BB  !
UserFollowViewModelBB" 5
>BB5 6
(BB6 7
)BB7 8
;BB8 9
	CreateMapCC 
<CC 
UserConnectionCC $
,CC$ %#
UserConnectionViewModelCC& =
>CC= >
(CC> ?
)CC? @
;CC@ A
}EE 	
}FF 
}GG �
}C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\AutoMapper\Resolvers\GamePlatformResolver.cs
	namespace		 	
IndieVisible		
 
.		 
Application		 "
.		" #

AutoMapper		# -
.		- .
	Resolvers		. 7
{

 
public 

class (
GamePlatformToDomainResolver -
:. /
IValueResolver0 >
<> ?
GameViewModel? L
,L M
GameN R
,R S
stringT Z
>Z [
{ 
public 
string 
Resolve 
( 
GameViewModel +
source, 2
,2 3
Game4 8
destination9 D
,D E
stringF L

destMemberM W
,W X
ResolutionContextY j
contextk r
)r s
{ 	
var 
result 
= 
string 
.  
Empty  %
;% &
if 
( 
source 
. 
	Platforms  
==! #
null$ (
||) +
!, -
source- 3
.3 4
	Platforms4 =
.= >
Any> A
(A B
)B C
)C D
{ 
return 
result 
; 
} 
result 
= 
string 
. 
Join  
(  !
$char! $
,$ %
source& ,
., -
	Platforms- 6
)6 7
;7 8
return 
result 
; 
} 	
} 
public 

class *
GamePlatformFromDomainResolver /
:0 1
IValueResolver2 @
<@ A
GameA E
,E F
GameViewModelG T
,T U
ListV Z
<Z [
GamePlatforms[ h
>h i
>i j
{ 
public 
List 
< 
GamePlatforms !
>! "
Resolve# *
(* +
Game+ /
source0 6
,6 7
GameViewModel8 E
destinationF Q
,Q R
ListS W
<W X
GamePlatformsX e
>e f

destMemberg q
,q r
ResolutionContext	s �
context
� �
)
� �
{ 	
var   
	platforms   
=   
(   
source   #
.  # $
	Platforms  $ -
??  . 0
string  1 7
.  7 8
Empty  8 =
)  = >
.!! 
Replace!! 
(!! 
$str!! "
,!!" #
$str!!$ *
)!!* +
."" 
Replace"" 
("" 
$str"" '
,""' (
$str"") 6
)""6 7
.## 
Split## 
(## 
new## 
Char## 
[##  
]##  !
{##" #
$char##$ '
}##( )
)##) *
;##* +
var%% 
platformsConverted%% "
=%%# $
	platforms%%% .
.%%. /
Where%%/ 4
(%%4 5
x%%5 6
=>%%7 9
!%%: ;
string%%; A
.%%A B
IsNullOrWhiteSpace%%B T
(%%T U
x%%U V
)%%V W
)%%W X
.%%X Y
Select%%Y _
(%%_ `
x%%` a
=>%%b d
(%%e f
GamePlatforms%%f s
)%%s t
Enum%%t x
.%%x y
Parse%%y ~
(%%~ 
typeof	%% �
(
%%� �
GamePlatforms
%%� �
)
%%� �
,
%%� �
x
%%� �
)
%%� �
)
%%� �
;
%%� �
return'' 
platformsConverted'' %
.''% &
ToList''& ,
('', -
)''- .
;''. /
}(( 	
})) 
}** �
~C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\AutoMapper\Resolvers\UserLanguagesResolver.cs
	namespace

 	
IndieVisible


 
.

 
Application

 "
.

" #

AutoMapper

# -
.

- .
	Resolvers

. 7
{ 
public 

class )
UserLanguagesToDomainResolver .
:/ 0
IValueResolver1 ?
<? @$
UserPreferencesViewModel@ X
,X Y
UserPreferencesZ i
,i j
stringk q
>q r
{ 
public 
string 
Resolve 
( $
UserPreferencesViewModel 6
source7 =
,= >
UserPreferences? N
destinationO Z
,Z [
string\ b

destMemberc m
,m n
ResolutionContext	o �
context
� �
)
� �
{ 	
var 
result 
= 
string 
.  
Empty  %
;% &
if 
( 
source 
. 
	Languages  
==! #
null$ (
||) +
!, -
source- 3
.3 4
	Languages4 =
.= >
Any> A
(A B
)B C
)C D
{ 
return 
result 
; 
} 
result 
= 
string 
. 
Join  
(  !
$char! $
,$ %
source& ,
., -
	Languages- 6
)6 7
;7 8
return 
result 
; 
} 	
} 
public 

class +
UserLanguagesFromDomainResolver 0
:1 2
IValueResolver3 A
<A B
UserPreferencesB Q
,Q R$
UserPreferencesViewModelS k
,k l
Listm q
<q r
SupportedLanguage	r �
>
� �
>
� �
{ 
public 
List 
< 
SupportedLanguage %
>% &
Resolve' .
(. /
UserPreferences/ >
source? E
,E F$
UserPreferencesViewModelG _
destination` k
,k l
Listm q
<q r
SupportedLanguage	r �
>
� �

destMember
� �
,
� �
ResolutionContext
� �
context
� �
)
� �
{   	
var!! 
	platforms!! 
=!! 
(!! 
source!! #
.!!# $
ContentLanguages!!$ 4
??!!5 7
string!!8 >
.!!> ?
Empty!!? D
)!!D E
."" 
Split"" 
("" 
new"" 
Char"" 
[""  
]""  !
{""" #
$char""$ '
}""( )
)"") *
;""* +
var$$ 
platformsConverted$$ "
=$$# $
	platforms$$% .
.$$. /
Where$$/ 4
($$4 5
x$$5 6
=>$$7 9
!$$: ;
string$$; A
.$$A B
IsNullOrWhiteSpace$$B T
($$T U
x$$U V
)$$V W
)$$W X
.$$X Y
Select$$Y _
($$_ `
x$$` a
=>$$b d
($$e f
SupportedLanguage$$f w
)$$w x
Enum$$x |
.$$| }
Parse	$$} �
(
$$� �
typeof
$$� �
(
$$� �
SupportedLanguage
$$� �
)
$$� �
,
$$� �
x
$$� �
)
$$� �
)
$$� �
;
$$� �
return&& 
platformsConverted&& %
.&&% &
ToList&&& ,
(&&, -
)&&- .
;&&. /
}'' 	
}(( 
})) �)
~C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\AutoMapper\ViewModelToDomainMappingProfile.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

AutoMapper# -
{ 
public 

class +
ViewModelToDomainMappingProfile 0
:1 2
Profile3 :
{ 
public +
ViewModelToDomainMappingProfile .
(. /
)/ 0
{ 	
	CreateMap 
< $
FeaturedContentViewModel .
,. /
Domain0 6
.6 7
Models7 =
.= >
FeaturedContent> M
>M N
(N O
)O P
;P Q
	CreateMap 
< $
UserPreferencesViewModel .
,. /
Domain0 6
.6 7
Models7 =
.= >
UserPreferences> M
>M N
(N O
)O P
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
ContentLanguages( 8
,8 9
opt: =
=>> @
optA D
.D E
ResolveUsingE Q
<Q R)
UserLanguagesToDomainResolverR o
>o p
(p q
)q r
)r s
;s t
	CreateMap 
< %
NotificationItemViewModel /
,/ 0
Domain1 7
.7 8
Models8 >
.> ?
Notification? K
>K L
(L M
)M N
;N O
	CreateMap 
< 
GameViewModel #
,# $
Domain% +
.+ ,
Models, 2
.2 3
Game3 7
>7 8
(8 9
)9 :
. 
	ForMember 
( 
dest #
=>$ &
dest' +
.+ ,
DeveloperName, 9
,9 :
opt; >
=>? A
optB E
.E F
MapFromF M
(M N
srcN Q
=>R T
srcU X
.X Y

AuthorNameY c
)c d
)d e
. 
	ForMember 
( 
dest #
=>$ &
dest' +
.+ ,
	Platforms, 5
,5 6
opt7 :
=>; =
opt> A
.A B
ResolveUsingB N
<N O(
GamePlatformToDomainResolverO k
>k l
(l m
)m n
)n o
;o p
	CreateMap"" 
<"" 
ProfileViewModel"" &
,""& '
Domain""( .
."". /
Models""/ 5
.""5 6
UserProfile""6 A
>""A B
(""B C
)""C D
;""D E
	CreateMap&& 
<&&  
UserContentViewModel&& *
,&&* +
Domain&&, 2
.&&2 3
Models&&3 9
.&&9 :
UserContent&&: E
>&&E F
(&&F G
)&&G H
;&&H I
	CreateMap'' 
<'' (
UserContentListItemViewModel'' 2
,''2 3
Domain''4 :
.'': ;
Models''; A
.''A B
UserContent''B M
>''M N
(''N O
)''O P
;''P Q
	CreateMap++ 
<++ &
BrainstormSessionViewModel++ 0
,++0 1
Domain++2 8
.++8 9
Models++9 ?
.++? @
BrainstormSession++@ Q
>++Q R
(++R S
)++S T
;++T U
	CreateMap,, 
<,, #
BrainstormIdeaViewModel,, -
,,,- .
Domain,,/ 5
.,,5 6
Models,,6 <
.,,< =
BrainstormIdea,,= K
>,,K L
(,,L M
),,M N
;,,N O
	CreateMap-- 
<-- #
BrainstormVoteViewModel-- -
,--- .
Domain--/ 5
.--5 6
Models--6 <
.--< =
BrainstormVote--= K
>--K L
(--L M
)--M N
;--N O
	CreateMap.. 
<.. &
BrainstormCommentViewModel.. 0
,..0 1
Domain..2 8
...8 9
Models..9 ?
...? @
BrainstormComment..@ Q
>..Q R
(..R S
)..S T
;..T U
	CreateMap22 
<22 
UserBadgeViewModel22 (
,22( )
Domain22* 0
.220 1
Models221 7
.227 8
	UserBadge228 A
>22A B
(22B C
)22C D
;22D E
	CreateMap66 
<66 
GameFollowViewModel66 )
,66) *
Domain66+ 1
.661 2
Models662 8
.668 9

GameFollow669 C
>66C D
(66D E
)66E F
;66F G
	CreateMap88 
<88 
UserFollowViewModel88 )
,88) *
Domain88+ 1
.881 2
Models882 8
.888 9

UserFollow889 C
>88C D
(88D E
)88E F
;88F G
	CreateMap:: 
<:: #
UserConnectionViewModel:: -
,::- .
Domain::/ 5
.::5 6
Models::6 <
.::< =
UserConnection::= K
>::K L
(::L M
)::M N
;::N O
}<< 	
}== 
}>> �
]C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Constants.cs
	namespace 	
IndieVisible
 
. 
Application "
{ 
public 

static 
class 
	Constants !
{ 
public 
static 
string 
DefaultUsername ,
{ 	
get 
{ 
return		 
$str		  
;		  !
}

 
} 	
public 
static 
string 
DefaultAvatar *
{ 	
get 
{ 
return 
$str <
;< =
} 
} 	
public 
static 
string $
DefaultProfileCoverImage 5
{ 	
get 
{ 
return 
$str C
;C D
} 
} 	
public 
static 
string !
DefaultGameCoverImage 2
{ 	
get 
{ 
return   
$str   @
;  @ A
}!! 
}"" 	
public$$ 
static$$ 
string$$  
DefaultGameThumbnail$$ 1
{%% 	
get&& 
{'' 
return(( 
$str(( A
;((A B
})) 
}** 	
public,, 
static,, 
string,,  
DefaultFeaturedImage,, 1
{-- 	
get.. 
{// 
return00 
$str00 ?
;00? @
}11 
}22 	
public44 
static44 
string44 
DefaultImagePath44 -
{55 	
get66 
{77 
return88 
$str88 '
;88' (
}99 
}:: 	
public<< 
static<< 
string<<  
DefaultUserImagePath<< 1
{== 	
get>> 
{?? 
return@@ 
$str@@ +
;@@+ ,
}AA 
}BB 	
publicDD 
staticDD 
stringDD 
DefaultCdnPathDD +
{EE 	
getFF 
{GG 
returnHH 
$strHH ?
;HH? @
}II 
}JJ 	
publicLL 
staticLL 
stringLL #
DefaultAzureStoragePathLL 4
{MM 	
getNN 
{OO 
returnPP 
$strPP D
;PPD E
}QQ 
}RR 	
}SS 
}TT �V
\C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\FakeData.cs
	namespace 	
IndieVisible
 
. 
Application "
{		 
public

 

static

 
class

 
FakeData

  
{ 
public 
static 
CarouselViewModel '
FakeCarousel( 4
(4 5
)5 6
{ 	
CarouselViewModel 
carousel &
=' (
new) ,
CarouselViewModel- >
(> ?
)? @
;@ A
carousel 
. 
Items 
= 
new  
List! %
<% &$
FeaturedContentViewModel& >
>> ?
(? @
)@ A
;A B$
FeaturedContentViewModel $
item1% *
=+ ,
new- 0$
FeaturedContentViewModel1 I
{ 
Url 
= 
$str 
, 
ImageUrl 
= 
$str 5
,5 6
Title 
= 
$str 
, 
Introduction 
= 
$str <
} 
; 
carousel 
. 
Items 
. 
Add 
( 
item1 $
)$ %
;% &$
FeaturedContentViewModel $
item2% *
=+ ,
new- 0$
FeaturedContentViewModel1 I
{ 
Url 
= 
$str 
, 
ImageUrl 
= 
$str 8
,8 9
Title 
= 
$str $
,$ %
Introduction   
=   
$str   K
}!! 
;!! 
carousel"" 
."" 
Items"" 
."" 
Add"" 
("" 
item2"" $
)""$ %
;""% &$
FeaturedContentViewModel$$ $
item3$$% *
=$$+ ,
new$$- 0$
FeaturedContentViewModel$$1 I
{%% 
Url&& 
=&& 
$str&& 
,&& 
ImageUrl'' 
='' 
$str'' :
,'': ;
Title(( 
=(( 
$str(( 3
,((3 4
Introduction)) 
=)) 
$str)) X
}** 
;** 
carousel++ 
.++ 
Items++ 
.++ 
Add++ 
(++ 
item3++ $
)++$ %
;++% &$
FeaturedContentViewModel-- $
item4--% *
=--+ ,
new--- 0$
FeaturedContentViewModel--1 I
{.. 
Url// 
=// 
$str// 
,// 
ImageUrl00 
=00 
$str00 E
,00E F
Title11 
=11 
$str11 "
,11" #
Introduction22 
=22 
$str22 ;
}33 
;33 
carousel44 
.44 
Items44 
.44 
Add44 
(44 
item444 $
)44$ %
;44% &
return66 
carousel66 
;66 
}77 	
public99 
static99 
CountersViewModel99 '
FakeCounters99( 4
(994 5
)995 6
{:: 	
CountersViewModel;; 
counters;; &
=;;' (
new;;) ,
CountersViewModel;;- >
(;;> ?
);;? @
;;;@ A
counters== 
.== 

GamesCount== 
===  !
$num==" &
;==& '
counters>> 
.>> 

UsersCount>> 
=>>  !
$num>>" &
;>>& '
counters?? 
.?? 
ArticlesCount?? "
=??# $
$num??% (
;??( )
counters@@ 
.@@ 
	JamsCount@@ 
=@@  
$num@@! #
;@@# $
returnBB 
countersBB 
;BB 
}CC 	
publicEE 
staticEE 
ListEE 
<EE !
GameListItemViewModelEE 0
>EE0 1
FakeFeaturedGamesEE2 C
(EEC D
)EED E
{FF 	
ListGG 
<GG !
GameListItemViewModelGG &
>GG& '
gamesGG( -
=GG. /
newGG0 3
ListGG4 8
<GG8 9!
GameListItemViewModelGG9 N
>GGN O
(GGO P
)GGP Q
;GGQ R!
GameListItemViewModelII !
game2II" '
=II( )
newII* -!
GameListItemViewModelII. C
(IIC D
)IID E
;IIE F
game2JJ 
.JJ 
ThumbnailUrlJJ 
=JJ  
$strJJ! D
;JJD E
game2KK 
.KK 
DeveloperImageUrlKK #
=KK$ %
$strKK& P
;KKP Q
game2LL 
.LL 
TitleLL 
=LL 
$strLL %
;LL% &
game2MM 
.MM 
DeveloperNameMM 
=MM  !
$strMM" 4
;MM4 5
game2NN 
.NN 
PriceNN 
=NN 
$strNN  
;NN  !
gamesUU 
.UU 
AddUU 
(UU 
game2UU 
)UU 
;UU !
GameListItemViewModelWW !
game3WW" '
=WW( )
newWW* -!
GameListItemViewModelWW. C
(WWC D
)WWD E
;WWE F
game3XX 
.XX 
ThumbnailUrlXX 
=XX  
$strXX! D
;XXD E
game3YY 
.YY 
DeveloperImageUrlYY #
=YY$ %
$strYY& P
;YYP Q
game3ZZ 
.ZZ 
TitleZZ 
=ZZ 
$strZZ )
;ZZ) *
game3[[ 
.[[ 
DeveloperName[[ 
=[[  !
$str[[" 4
;[[4 5
game3\\ 
.\\ 
Price\\ 
=\\ 
$str\\  
;\\  !
gamesaa 
.aa 
Addaa 
(aa 
game3aa 
)aa 
;aa !
GameListItemViewModelcc !
game1cc" '
=cc( )
newcc* -!
GameListItemViewModelcc. C
(ccC D
)ccD E
;ccE F
game1dd 
.dd 
ThumbnailUrldd 
=dd  
$strdd! D
;ddD E
game1ee 
.ee 
DeveloperImageUrlee #
=ee$ %
$stree& P
;eeP Q
game1ff 
.ff 
Titleff 
=ff 
$strff #
;ff# $
game1gg 
.gg 
DeveloperNamegg 
=gg  !
$strgg" 0
;gg0 1
game1hh 
.hh 
Pricehh 
=hh 
$strhh  
;hh  !
gamesnn 
.nn 
Addnn 
(nn 
game1nn 
)nn 
;nn 
returnpp 
gamespp 
;pp 
}qq 	
publicss 
staticss 
ProfileViewModelss &
FakeProfiless' 2
(ss2 3
)ss3 4
{tt 	
ProfileViewModeluu 
profileuu $
=uu% &
newuu' *
ProfileViewModeluu+ ;
(uu; <
)uu< =
;uu= >
profileww 
.ww 
Typeww 
=ww 
ProfileTypeww &
.ww& '
Personalww' /
;ww/ 0
profileyy 
.yy 
Nameyy 
=yy 
$stryy $
;yy$ %
profilezz 
.zz 
Mottozz 
=zz 
$strzz (
;zz( )
profile{{ 
.{{ 
CoverImageUrl{{ !
={{" #
$str{{$ B
;{{B C
profile}} 
.}} 
Bio}} 
=}} 
$str}} i
;}}i j
profile 
. 

StudioName 
=  
$str! 6
;6 7
profile
�� 
.
�� 
Location
�� 
=
�� 
$str
�� )
;
��) *
profile
�� 
.
�� 
GameJoltUrl
�� 
=
��  !
string
��" (
.
��( )
Empty
��) .
;
��. /
profile
�� 
.
�� 
	ItchIoUrl
�� 
=
�� 
string
��  &
.
��& '
Empty
��' ,
;
��, -
profile
�� 
.
�� 

IndieDbUrl
�� 
=
��  
string
��! '
.
��' (
Empty
��( -
;
��- .
profile
�� 
.
�� 
UnityConnectUrl
�� #
=
��$ %
string
��& ,
.
��, -
Empty
��- 2
;
��2 3
profile
�� 
.
�� 
GameDevNetUrl
�� !
=
��" #
string
��$ *
.
��* +
Empty
��+ 0
;
��0 1
profile
�� 
.
�� 
Counters
�� 
.
�� 
	Followers
�� &
=
��' (
$num
��) -
;
��- .
profile
�� 
.
�� 
Counters
�� 
.
�� 
	Following
�� &
=
��' (
$num
��) ,
;
��, -
profile
�� 
.
�� 
Counters
�� 
.
�� 
Connections
�� (
=
��) *
$num
��+ /
;
��/ 0
profile
�� 
.
�� 
Counters
�� 
.
�� 
Games
�� "
=
��# $
$num
��% '
;
��' (
profile
�� 
.
�� 
Counters
�� 
.
�� 
Posts
�� "
=
��# $
$num
��% &
;
��& '
profile
�� 
.
�� 
Counters
�� 
.
�� 
Comments
�� %
=
��& '
$num
��( -
;
��- .
profile
�� 
.
�� 
Counters
�� 
.
�� 
Jams
�� !
=
��" #
$num
��$ &
;
��& '
profile
�� 
.
�� 
IndieXp
�� 
.
�� 
Level
�� !
=
��" #
$num
��$ %
;
��% &
profile
�� 
.
�� 
IndieXp
�� 
.
�� 
LevelXp
�� #
=
��$ %
$num
��& )
;
��) *
profile
�� 
.
�� 
IndieXp
�� 
.
�� 
NextLevelXp
�� '
=
��( )
$num
��* .
;
��. /
profile
�� 
.
�� 
ExternalLinks
�� !
.
��! "
Add
��" %
(
��% &
ExternalLinks
��& 3
.
��3 4
Website
��4 ;
,
��; <
$str
��= Z
)
��Z [
;
��[ \
profile
�� 
.
�� 
ExternalLinks
�� !
.
��! "
Add
��" %
(
��% &
ExternalLinks
��& 3
.
��3 4
Facebook
��4 <
,
��< =
$str
��> W
)
��W X
;
��X Y
return
�� 
profile
�� 
;
�� 
}
�� 	
}
�� 
}�� �
kC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Formatters\UrlFormatter.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

Formatters# -
{ 
public 

static 
class 
UrlFormatter $
{ 
public 
static 
string 
ProfileImage )
() *
Guid* .
userId/ 5
)5 6
{		 	
return 
String 
. 
Format  
(  !
$str! .
,. /
	Constants0 9
.9 : 
DefaultUserImagePath: N
,N O
BlobTypeP X
.X Y
ProfileImageY e
,e f
userIdg m
,m n
userIdo u
)u v
;v w
} 	
public 
static 
string 
ProfileCoverImage .
(. /
Guid/ 3
userId4 :
,: ;
Guid< @
	profileIdA J
)J K
{ 	
return 
String 
. 
Format  
(  !
$str! ;
,; <
	Constants= F
.F G
DefaultCdnPathG U
,U V
userIdW ]
,] ^
	profileId_ h
)h i
;i j
} 	
public 
static 
string 
Image "
(" #
Guid# '
userId( .
,. /
BlobType0 8
type9 =
,= >
string? E
fileNameF N
)N O
{ 	
if 
( 
fileName 
. 

StartsWith #
(# $
	Constants$ -
.- .
DefaultCdnPath. <
)< =
)= >
{ 
return 
fileName 
;  
} 
else 
{ 
return 
String 
. 
Format $
($ %
$str% 2
,2 3
	Constants4 =
.= >
DefaultCdnPath> L
.L M
TrimEndM T
(T U
$charU X
)X Y
,Y Z
userId[ a
,a b
fileNamec k
)k l
;l m
} 
} 	
} 
}   �
tC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Interfaces\IBrainstormAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

Interfaces# -
{ 
public		 

	interface		 !
IBrainstormAppService		 *
:		+ ,
ICrudAppService		- <
<		< =#
BrainstormIdeaViewModel		= T
>		T U
{

 !
OperationResultListVo 
< #
BrainstormIdeaViewModel 5
>5 6
GetAll7 =
(= >
Guid> B
userIdC I
)I J
;J K
OperationResultVo 
< #
BrainstormIdeaViewModel 1
>1 2
GetById3 :
(: ;
Guid; ?
userId@ F
,F G
GuidH L
idM O
)O P
;P Q
OperationResultVo 
Vote 
( 
Guid #
userId$ *
,* +
Guid, 0
ideaId1 7
,7 8
	VoteValue9 B
voteC G
)G H
;H I
OperationResultVo 
Comment !
(! "'
UserContentCommentViewModel" =
vm> @
)@ A
;A B
OperationResultVo 
< &
BrainstormSessionViewModel 4
>4 5

GetSession6 @
(@ A
GuidA E
userIdF L
,L M!
BrainstormSessionTypeN c
typed h
)h i
;i j!
OperationResultListVo 
< &
BrainstormSessionViewModel 8
>8 9
GetSessions: E
(E F
GuidF J
userIdK Q
)Q R
;R S
OperationResultVo 
< 
Guid 
> 
SaveSession  +
(+ ,&
BrainstormSessionViewModel, F
vmG I
)I J
;J K!
OperationResultListVo 
< #
BrainstormIdeaViewModel 5
>5 6
GetAllBySessionId7 H
(H I
GuidI M
userIdN T
,T U
GuidV Z
	sessionId[ d
)d e
;e f
} 
} �

nC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Interfaces\ICrudAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

Interfaces# -
{		 
public

 

	interface

 
ICrudAppService

 $
<

$ %
T

% &
>

& '
{ 
Guid 
CurrentUserId 
{ 
get  
;  !
set" %
;% &
}' (
OperationResultVo 
< 
int 
> 
Count $
($ %
)% &
;& '!
OperationResultListVo 
< 
T 
>  
GetAll! '
(' (
)( )
;) *
OperationResultVo 
< 
T 
> 
GetById $
($ %
Guid% )
id* ,
), -
;- .
OperationResultVo 
< 
Guid 
> 
Save  $
($ %
T% &
	viewModel' 0
)0 1
;1 2
OperationResultVo 
Remove  
(  !
Guid! %
id& (
)( )
;) *
} 
} �	
yC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Interfaces\IFeaturedContentAppService.cs
	namespace

 	
IndieVisible


 
.

 
Application

 "
.

" #

Interfaces

# -
{ 
public 

	interface &
IFeaturedContentAppService /
:0 1
ICrudAppService2 A
<A B$
FeaturedContentViewModelB Z
>Z [
{ 
CarouselViewModel 
GetFeaturedNow (
(( )
)) *
;* +
OperationResultVo 
< 
Guid 
> 
Add  #
(# $
Guid$ (
userId) /
,/ 0
Guid1 5
	contentId6 ?
,? @
stringA G
titleH M
,M N
stringO U
introductionV b
)b c
;c d
IEnumerable 
< ,
 UserContentToBeFeaturedViewModel 4
>4 5"
GetContentToBeFeatured6 L
(L M
)M N
;N O
OperationResultVo 
	Unfeature #
(# $
Guid$ (
id) +
)+ ,
;, -
} 
} �
pC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Interfaces\IFollowAppService.cs
	namespace		 	
IndieVisible		
 
.		 
Application		 "
.		" #

Interfaces		# -
{

 
public 

	interface 
IFollowAppService &
{ 
OperationResultVo 

GameFollow $
($ %
Guid% )
userId* 0
,0 1
Guid2 6
gameId7 =
)= >
;> ?
OperationResultVo 
GameUnfollow &
(& '
Guid' +
userId, 2
,2 3
Guid4 8
gameId9 ?
)? @
;@ A
OperationResultVo 

UserFollow $
($ %
Guid% )
userId* 0
,0 1
Guid2 6
followUserId7 C
)C D
;D E
OperationResultVo 
UserUnfollow &
(& '
Guid' +
userId, 2
,2 3
Guid4 8
followUserId9 E
)E F
;F G
} 
} �
nC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Interfaces\IGameAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

Interfaces# -
{		 
public

 

	interface

 
IGameAppService

 $
:

% &
ICrudAppService

' 6
<

6 7
GameViewModel

7 D
>

D E
{ 
IEnumerable 
< !
GameListItemViewModel )
>) *
	GetLatest+ 4
(4 5
Guid5 9
currentUserId: G
,G H
intI L
countM R
,R S
GuidT X
userIdY _
,_ `
	GameGenrea j
genrek p
)p q
;q r
IEnumerable 
< 
SelectListItemVo $
>$ %
	GetByUser& /
(/ 0
Guid0 4
userId5 ;
); <
;< =
} 
} �
tC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Interfaces\IGameFollowAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

Interfaces# -
{ 
public		 

	interface		 !
IGameFollowAppService		 *
:		+ ,
ICrudAppService		- <
<		< =
GameFollowViewModel		= P
>		P Q
{

 !
OperationResultListVo 
< 
GameFollowViewModel 1
>1 2
GetByGameId3 >
(> ?
Guid? C
gameIdD J
)J K
;K L
} 
} �
sC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Interfaces\IImageStorageService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

Interfaces# -
{ 
public		 

	interface		  
IImageStorageService		 )
{

 
Task 
< 
string 
> 
StoreImageAsync $
($ %
string% +
	container, 5
,5 6
string7 =
filename> F
,F G
byteH L
[L M
]M N
imageO T
)T U
;U V
Task 
< 
string 
> 
DeleteImageAsync %
(% &
string& ,
	container- 6
,6 7
string8 >
filename? G
)G H
;H I
} 
} �
nC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Interfaces\ILikeAppService.cs
	namespace		 	
IndieVisible		
 
.		 
Application		 "
.		" #

Interfaces		# -
{

 
public 

	interface 
ILikeAppService $
:% &
ICrudAppService' 6
<6 7
UserLikeViewModel7 H
>H I
{ 
OperationResultVo 
ContentLike %
(% &
Guid& *
likedId+ 2
)2 3
;3 4
OperationResultVo 
ContentUnlike '
(' (
Guid( ,
likedId- 4
)4 5
;5 6
OperationResultVo 
GameLike "
(" #
Guid# '
userId( .
). /
;/ 0
OperationResultVo 

GameUnlike $
($ %
Guid% )
likedId* 1
)1 2
;2 3
} 
} �	
vC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Interfaces\INotificationAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

Interfaces# -
{ 
public 

	interface #
INotificationAppService ,
:- .
ICrudAppService/ >
<> ?%
NotificationItemViewModel? X
>X Y
{		 !
OperationResultListVo 
< %
NotificationItemViewModel 7
>7 8
GetByUserId9 D
(D E
GuidE I
userIdJ P
,P Q
intR U
countV [
)[ \
;\ ]
OperationResultVo 
Notify  
(  !
Guid! %
targetUserId& 2
,2 3
NotificationType4 D
contentLikeE P
,P Q
GuidR V
targetIdW _
,_ `
stringa g
texth l
,l m
stringn t
urlu x
)x y
;y z
OperationResultVo 

MarkAsRead $
($ %
Guid% )
id* ,
), -
;- .
} 
} �
qC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Interfaces\IProfileAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

Interfaces# -
{ 
public		 

	interface		 
IProfileAppService		 '
:		( )
ICrudAppService		* 9
<		9 :
ProfileViewModel		: J
>		J K
{

 
ProfileViewModel 
GetByUserId $
($ %
Guid% )
userId* 0
,0 1
ProfileType2 =
type> B
)B C
;C D
ProfileViewModel 
GetByUserId $
($ %
Guid% )
currentUserId* 7
,7 8
Guid9 =
userId> D
,D E
ProfileTypeF Q
typeR V
)V W
;W X
ProfileViewModel 
GenerateNewOne '
(' (
ProfileType( 3
type4 8
)8 9
;9 :
} 
} �
sC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Interfaces\IUserBadgeAppService.cs
	namespace		 	
IndieVisible		
 
.		 
Application		 "
.		" #

Interfaces		# -
{

 
public 

	interface  
IUserBadgeAppService )
:* +
ICrudAppService, ;
<; <
UserBadgeViewModel< N
>N O
{ !
OperationResultListVo 
< 
UserBadgeViewModel 0
>0 1
	GetByUser2 ;
(; <
Guid< @
userIdA G
)G H
;H I
} 
} �
xC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Interfaces\IUserConnectionAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

Interfaces# -
{ 
public		 

	interface		 %
IUserConnectionAppService		 .
:		/ 0
ICrudAppService		1 @
<		@ A#
UserConnectionViewModel		A X
>		X Y
{

 !
OperationResultListVo 
< #
UserConnectionViewModel 5
>5 6
GetByTargetUserId7 H
(H I
GuidI M
targetUserIdN Z
)Z [
;[ \
OperationResultVo 
Connect !
(! "
Guid" &
currentUserId' 4
,4 5
Guid6 :
userId; A
)A B
;B C
OperationResultVo 

Disconnect $
($ %
Guid% )
currentUserId* 7
,7 8
Guid9 =
userId> D
)D E
;E F
OperationResultVo 
Allow 
(  
Guid  $
currentUserId% 2
,2 3
Guid4 8
userId9 ?
)? @
;@ A
OperationResultVo 
Deny 
( 
Guid #
currentUserId$ 1
,1 2
Guid3 7
userId8 >
)> ?
;? @
} 
} �
uC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Interfaces\IUserContentAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

Interfaces# -
{ 
public		 

	interface		 "
IUserContentAppService		 +
:		, -
ICrudAppService		. =
<		= > 
UserContentViewModel		> R
>		R S
{

 
IEnumerable 
< (
UserContentListItemViewModel 0
>0 1
GetActivityFeed2 A
(A B
GuidB F
currentUserIdG T
,T U
intV Y
countZ _
,_ `
Guida e
gameIdf l
,l m
Guidn r
userIds y
,y z
List{ 
<	 �
SupportedLanguage
� �
>
� �
	languages
� �
)
� �
;
� �
int 
CountArticles 
( 
) 
; 
} 
} �
|C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Interfaces\IUserContentCommentAppService.cs
	namespace		 	
IndieVisible		
 
.		 
Application		 "
.		" #

Interfaces		# -
{

 
public 

	interface )
IUserContentCommentAppService 2
:3 4
ICrudAppService5 D
<D E'
UserContentCommentViewModelE `
>` a
{ 
OperationResultVo 
Comment !
(! "'
UserContentCommentViewModel" =
	viewModel> G
)G H
;H I
} 
} �
tC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Interfaces\IUserFollowAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

Interfaces# -
{ 
public		 

	interface		 !
IUserFollowAppService		 *
:		+ ,
ICrudAppService		- <
<		< =
UserFollowViewModel		= P
>		P Q
{

 !
OperationResultListVo 
< 
UserFollowViewModel 1
>1 2
GetByUserId3 >
(> ?
Guid? C
userIdD J
)J K
;K L!
OperationResultListVo 
< 
UserFollowViewModel 1
>1 2
GetByFollowedId3 B
(B C
GuidC G
followUserIdH T
)T U
;U V
} 
} �
yC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Interfaces\IUserPreferencesAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

Interfaces# -
{ 
public 

	interface &
IUserPreferencesAppService /
:0 1
ICrudAppService2 A
<A B$
UserPreferencesViewModelB Z
>Z [
{		 $
UserPreferencesViewModel  
GetByUserId! ,
(, -
Guid- 1
userId2 8
)8 9
;9 :
} 
} �
pC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Services\Base\BaseAppService.cs
	namespace		 	
IndieVisible		
 
.		 
Application		 "
.		" #
Services		# +
{

 
public 

class 
BaseAppService 
{ 
public 
Guid 
CurrentUserId !
{" #
get$ '
;' (
set) ,
;, -
}. /
	protected 
	MediaType 
GetMediaType (
(( )
string) /
featuredImage0 =
)= >
{ 	
if 
( 
string 
. 
IsNullOrWhiteSpace )
() *
featuredImage* 7
)7 8
)8 9
{ 
return 
	MediaType  
.  !
None! %
;% &
} 
var 
youtubePattern 
=  
$str! U
;U V
var 
match 
= 
Regex 
. 
Match #
(# $
featuredImage$ 1
,1 2
youtubePattern3 A
)A B
;B C
if 
( 
match 
. 
Success 
) 
{ 
return 
	MediaType  
.  !
Youtube! (
;( )
} 
var   
imageExtensions   
=    !
new  " %
string  & ,
[  , -
]  - .
{  / 0
$str  1 6
,  6 7
$str  8 =
,  = >
$str  ? D
,  D E
$str  F L
,  L M
$str  N T
,  T U
$str  V [
,  [ \
$str  ] c
,  c d
$str  e k
,  k l
$str  m r
}  s t
;  t u
var!! 
videoExtensions!! 
=!!  !
new!!" %
string!!& ,
[!!, -
]!!- .
{!!/ 0
$str!!1 6
,!!6 7
$str!!8 =
,!!= >
$str!!? E
,!!E F
$str!!G L
,!!L M
$str!!N T
,!!T U
$str!!V [
,!![ \
$str!!] b
,!!b c
$str!!d i
,!!i j
$str!!k p
,!!p q
$str!!r w
,!!w x
$str!!y ~
,!!~ 
$str
!!� �
}
!!� �
;
!!� �
var## 
	extension## 
=## 
featuredImage## )
?##) *
.##* +
Split##+ 0
(##0 1
$char##1 4
)##4 5
.##5 6
Last##6 :
(##: ;
)##; <
;##< =
if&& 
(&& 
imageExtensions&& 
.&&  
Contains&&  (
(&&( )
	extension&&) 2
.&&2 3
ToLower&&3 :
(&&: ;
)&&; <
)&&< =
)&&= >
{'' 
return(( 
	MediaType((  
.((  !
Image((! &
;((& '
})) 
else** 
if** 
(** 
videoExtensions** $
.**$ %
Contains**% -
(**- .
	extension**. 7
.**7 8
ToLower**8 ?
(**? @
)**@ A
)**A B
)**B C
{++ 
return,, 
	MediaType,,  
.,,  !
Video,,! &
;,,& '
}-- 
return// 
	MediaType// 
.// 
Image// "
;//" #
}00 	
public22 
void22 
Dispose22 
(22 
)22 
{33 	
GC44 
.44 
SuppressFinalize44 
(44  
this44  $
)44$ %
;44% &
}55 	
}66 
}77 ��
qC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Services\BrainstormAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #
Services# +
{ 
public 

class  
BrainstormAppService %
:& '
BaseAppService( 6
,6 7!
IBrainstormAppService8 M
{ 
private 
readonly 
IMapper  
mapper! '
;' (
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
private 
readonly (
IBrainstormSessionRepository 5'
brainstormSessionRepository6 Q
;Q R
private 
readonly %
IBrainstormIdeaRepository 2$
brainstormIdeaRepository3 K
;K L
private 
readonly %
IBrainstormVoteRepository 2$
brainstormVoteRepository3 K
;K L
private 
readonly (
IBrainstormCommentRepository 5'
brainstormCommentRepository6 Q
;Q R
private 
readonly &
IGamificationDomainService 3%
gamificationDomainService4 M
;M N
public 
Guid 
CurrentUserId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public  
BrainstormAppService #
(# $
IMapper$ +
mapper, 2
,2 3
IUnitOfWork4 ?

unitOfWork@ J
,   (
IBrainstormSessionRepository   *'
brainstormSessionRepository  + F
,  F G%
IBrainstormIdeaRepository  H a$
brainstormIdeaRepository  b z
,  z {&
IBrainstormVoteRepository	  | �&
brainstormVoteRepository
  � �
,
  � �*
IBrainstormCommentRepository
  � �)
brainstormCommentRepository
  � �
,!! &
IGamificationDomainService!! (%
gamificationDomainService!!) B
)!!B C
{"" 	
this## 
.## 
mapper## 
=## 
mapper##  
;##  !
this$$ 
.$$ 

unitOfWork$$ 
=$$ 

unitOfWork$$ (
;$$( )
this%% 
.%% $
brainstormIdeaRepository%% )
=%%* +$
brainstormIdeaRepository%%, D
;%%D E
this&& 
.&& '
brainstormSessionRepository&& ,
=&&- .'
brainstormSessionRepository&&/ J
;&&J K
this'' 
.'' $
brainstormVoteRepository'' )
=''* +$
brainstormVoteRepository'', D
;''D E
this(( 
.(( '
brainstormCommentRepository(( ,
=((- .'
brainstormCommentRepository((/ J
;((J K
this)) 
.)) %
gamificationDomainService)) *
=))+ ,%
gamificationDomainService))- F
;))F G
}** 	
public,, 
OperationResultVo,,  
<,,  !
int,,! $
>,,$ %
Count,,& +
(,,+ ,
),,, -
{-- 	
OperationResultVo.. 
<.. 
int.. !
>..! "
result..# )
;..) *
try00 
{11 
int22 
count22 
=22 $
brainstormIdeaRepository22 4
.224 5
GetAll225 ;
(22; <
)22< =
.22= >
Count22> C
(22C D
)22D E
;22E F
result44 
=44 
new44 
OperationResultVo44 .
<44. /
int44/ 2
>442 3
(443 4
count444 9
)449 :
;44: ;
}55 
catch66 
(66 
	Exception66 
ex66 
)66  
{77 
result88 
=88 
new88 
OperationResultVo88 .
<88. /
int88/ 2
>882 3
(883 4
ex884 6
.886 7
Message887 >
)88> ?
;88? @
}99 
return;; 
result;; 
;;; 
}<< 	
public>> !
OperationResultListVo>> $
<>>$ %#
BrainstormIdeaViewModel>>% <
>>>< =
GetAll>>> D
(>>D E
)>>E F
{?? 	!
OperationResultListVo@@ !
<@@! "#
BrainstormIdeaViewModel@@" 9
>@@9 :
result@@; A
;@@A B
tryBB 
{CC 

IQueryableDD 
<DD 
BrainstormIdeaDD )
>DD) *
	allModelsDD+ 4
=DD5 6$
brainstormIdeaRepositoryDD7 O
.DDO P
GetAllDDP V
(DDV W
)DDW X
;DDX Y
IEnumerableFF 
<FF #
BrainstormIdeaViewModelFF 3
>FF3 4
vmsFF5 8
=FF9 :
mapperFF; A
.FFA B
MapFFB E
<FFE F
IEnumerableFFF Q
<FFQ R
BrainstormIdeaFFR `
>FF` a
,FFa b
IEnumerableFFc n
<FFn o$
BrainstormIdeaViewModel	FFo �
>
FF� �
>
FF� �
(
FF� �
	allModels
FF� �
)
FF� �
;
FF� �
vmsHH 
=HH 
vmsHH 
.HH 
OrderByDescendingHH +
(HH+ ,
xHH, -
=>HH. 0
xHH1 2
.HH2 3
	VoteCountHH3 <
)HH< =
.HH= >
ThenByDescendingHH> N
(HHN O
xHHO P
=>HHQ S
xHHT U
.HHU V

CreateDateHHV `
)HH` a
;HHa b
resultJJ 
=JJ 
newJJ !
OperationResultListVoJJ 2
<JJ2 3#
BrainstormIdeaViewModelJJ3 J
>JJJ K
(JJK L
vmsJJL O
)JJO P
;JJP Q
}KK 
catchLL 
(LL 
	ExceptionLL 
exLL 
)LL  
{MM 
resultNN 
=NN 
newNN !
OperationResultListVoNN 2
<NN2 3#
BrainstormIdeaViewModelNN3 J
>NNJ K
(NNK L
exNNL N
.NNN O
MessageNNO V
)NNV W
;NNW X
}OO 
returnQQ 
resultQQ 
;QQ 
}RR 	
publicTT 
OperationResultVoTT  
<TT  !#
BrainstormIdeaViewModelTT! 8
>TT8 9
GetByIdTT: A
(TTA B
GuidTTB F
idTTG I
)TTI J
{UU 	
OperationResultVoVV 
<VV #
BrainstormIdeaViewModelVV 5
>VV5 6
resultVV7 =
;VV= >
tryXX 
{YY 
BrainstormIdeaZZ 
modelZZ $
=ZZ% &$
brainstormIdeaRepositoryZZ' ?
.ZZ? @
GetByIdZZ@ G
(ZZG H
idZZH J
)ZZJ K
;ZZK L#
BrainstormIdeaViewModel\\ '
vm\\( *
=\\+ ,
mapper\\- 3
.\\3 4
Map\\4 7
<\\7 8#
BrainstormIdeaViewModel\\8 O
>\\O P
(\\P Q
model\\Q V
)\\V W
;\\W X
vm__ 
.__ 
	VoteCount__ 
=__ $
brainstormVoteRepository__ 7
.__7 8
Count__8 =
(__= >
x__> ?
=>__@ B
x__C D
.__D E
IdeaId__E K
==__L N
vm__O Q
.__Q R
Id__R T
)__T U
;__U V
vm`` 
.`` 
Score`` 
=`` $
brainstormVoteRepository`` 3
.``3 4
GetAll``4 :
(``: ;
)``; <
.``< =
Where``= B
(``B C
x``C D
=>``E G
x``H I
.``I J
IdeaId``J P
==``Q S
vm``T V
.``V W
Id``W Y
)``Y Z
.``Z [
Sum``[ ^
(``^ _
x``_ `
=>``a c
(``d e
int``e h
)``h i
x``i j
.``j k
	VoteValue``k t
)``t u
;``u v
resultbb 
=bb 
newbb 
OperationResultVobb .
<bb. /#
BrainstormIdeaViewModelbb/ F
>bbF G
(bbG H
vmbbH J
)bbJ K
;bbK L
}cc 
catchdd 
(dd 
	Exceptiondd 
exdd 
)dd  
{ee 
resultff 
=ff 
newff 
OperationResultVoff .
<ff. /#
BrainstormIdeaViewModelff/ F
>ffF G
(ffG H
exffH J
.ffJ K
MessageffK R
)ffR S
;ffS T
}gg 
returnii 
resultii 
;ii 
}jj 	
publicll 
OperationResultVoll  
Removell! '
(ll' (
Guidll( ,
idll- /
)ll/ 0
{mm 	
OperationResultVonn 
resultnn $
;nn$ %
trypp 
{qq $
brainstormIdeaRepositorytt (
.tt( )
Removett) /
(tt/ 0
idtt0 2
)tt2 3
;tt3 4

unitOfWorkvv 
.vv 
Commitvv !
(vv! "
)vv" #
;vv# $
resultxx 
=xx 
newxx 
OperationResultVoxx .
(xx. /
truexx/ 3
)xx3 4
;xx4 5
}yy 
catchzz 
(zz 
	Exceptionzz 
exzz 
)zz  
{{{ 
result|| 
=|| 
new|| 
OperationResultVo|| .
(||. /
ex||/ 1
.||1 2
Message||2 9
)||9 :
;||: ;
}}} 
return 
result 
; 
}
�� 	
public
�� 
OperationResultVo
��  
<
��  !
Guid
��! %
>
��% &
Save
��' +
(
��+ ,%
BrainstormIdeaViewModel
��, C
	viewModel
��D M
)
��M N
{
�� 	
OperationResultVo
�� 
<
�� 
Guid
�� "
>
��" #
result
��$ *
;
��* +
try
�� 
{
�� 
BrainstormIdea
�� 
model
�� $
;
��$ %
BrainstormIdea
�� 
existing
�� '
=
��( )&
brainstormIdeaRepository
��* B
.
��B C
GetById
��C J
(
��J K
	viewModel
��K T
.
��T U
Id
��U W
)
��W X
;
��X Y
if
�� 
(
�� 
existing
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
model
�� 
=
�� 
mapper
�� "
.
��" #
Map
��# &
(
��& '
	viewModel
��' 0
,
��0 1
existing
��2 :
)
��: ;
;
��; <
}
�� 
else
�� 
{
�� 
model
�� 
=
�� 
mapper
�� "
.
��" #
Map
��# &
<
��& '
BrainstormIdea
��' 5
>
��5 6
(
��6 7
	viewModel
��7 @
)
��@ A
;
��A B
}
�� 
if
�� 
(
�� 
	viewModel
�� 
.
�� 
Id
��  
==
��! #
Guid
��$ (
.
��( )
Empty
��) .
)
��. /
{
�� 
BrainstormSession
�� %
session
��& -
=
��. /)
brainstormSessionRepository
��0 K
.
��K L
GetAll
��L R
(
��R S
)
��S T
.
��T U
FirstOrDefault
��U c
(
��c d
x
��d e
=>
��f h
x
��i j
.
��j k
Type
��k o
==
��p r$
BrainstormSessionType��s �
.��� �
Main��� �
)��� �
;��� �
model
�� 
.
�� 
	SessionId
�� #
=
��$ %
session
��& -
.
��- .
Id
��. 0
;
��0 1&
brainstormIdeaRepository
�� ,
.
��, -
Add
��- 0
(
��0 1
model
��1 6
)
��6 7
;
��7 8
	viewModel
�� 
.
�� 
Id
��  
=
��! "
model
��# (
.
��( )
Id
��) +
;
��+ ,
this
�� 
.
�� '
gamificationDomainService
�� 2
.
��2 3
ProcessAction
��3 @
(
��@ A
	viewModel
��A J
.
��J K
UserId
��K Q
,
��Q R
PlatformAction
��S a
.
��a b
IdeaSuggested
��b o
)
��o p
;
��p q
}
�� 
else
�� 
{
�� &
brainstormIdeaRepository
�� ,
.
��, -
Update
��- 3
(
��3 4
model
��4 9
)
��9 :
;
��: ;
}
�� 

unitOfWork
�� 
.
�� 
Commit
�� !
(
��! "
)
��" #
;
��# $
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
model
��5 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
ex
��5 7
.
��7 8
Message
��8 ?
)
��? @
;
��@ A
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� #
OperationResultListVo
�� $
<
��$ %%
BrainstormIdeaViewModel
��% <
>
��< =
GetAll
��> D
(
��D E
Guid
��E I
userId
��J P
)
��P Q
{
�� 	#
OperationResultListVo
�� !
<
��! "%
BrainstormIdeaViewModel
��" 9
>
��9 :
result
��; A
;
��A B
try
�� 
{
�� 

IQueryable
�� 
<
�� 
BrainstormIdea
�� )
>
��) *
	allModels
��+ 4
=
��5 6&
brainstormIdeaRepository
��7 O
.
��O P
GetAll
��P V
(
��V W
)
��W X
;
��X Y

IQueryable
�� 
<
�� 
BrainstormVote
�� )
>
��) *
currentUserVotes
��+ ;
=
��< =&
brainstormVoteRepository
��> V
.
��V W
GetByUserId
��W b
(
��b c
userId
��c i
)
��i j
;
��j k
IEnumerable
�� 
<
�� %
BrainstormIdeaViewModel
�� 3
>
��3 4
vms
��5 8
=
��9 :
mapper
��; A
.
��A B
Map
��B E
<
��E F
IEnumerable
��F Q
<
��Q R
BrainstormIdea
��R `
>
��` a
,
��a b
IEnumerable
��c n
<
��n o&
BrainstormIdeaViewModel��o �
>��� �
>��� �
(��� �
	allModels��� �
)��� �
;��� �
foreach
�� 
(
�� %
BrainstormIdeaViewModel
�� 0
item
��1 5
in
��6 8
vms
��9 <
)
��< =
{
�� 
item
�� 
.
�� 
UserContentType
�� (
=
��) *
UserContentType
��+ :
.
��: ;

VotingItem
��; E
;
��E F
item
�� 
.
�� 
	VoteCount
�� "
=
��# $&
brainstormVoteRepository
��% =
.
��= >
Count
��> C
(
��C D
x
��D E
=>
��F H
x
��I J
.
��J K
IdeaId
��K Q
==
��R T
item
��U Y
.
��Y Z
Id
��Z \
)
��\ ]
;
��] ^
item
�� 
.
�� 
Score
�� 
=
��  &
brainstormVoteRepository
��! 9
.
��9 :
GetAll
��: @
(
��@ A
)
��A B
.
��B C
Where
��C H
(
��H I
x
��I J
=>
��K M
x
��N O
.
��O P
IdeaId
��P V
==
��W Y
item
��Z ^
.
��^ _
Id
��_ a
)
��a b
.
��b c
Sum
��c f
(
��f g
x
��g h
=>
��i k
(
��l m
int
��m p
)
��p q
x
��q r
.
��r s
	VoteValue
��s |
)
��| }
;
��} ~
item
�� 
.
�� 
CurrentUserVote
�� (
=
��) *
currentUserVotes
��+ ;
.
��; <
FirstOrDefault
��< J
(
��J K
x
��K L
=>
��M O
x
��P Q
.
��Q R
IdeaId
��R X
==
��Y [
item
��\ `
.
��` a
Id
��a c
)
��c d
?
��d e
.
��e f
	VoteValue
��f o
??
��p r
	VoteValue
��s |
.
��| }
Neutral��} �
;��� �
item
�� 
.
�� 
CommentCount
�� %
=
��& ')
brainstormCommentRepository
��( C
.
��C D
Count
��D I
(
��I J
x
��J K
=>
��L N
x
��O P
.
��P Q
IdeaId
��Q W
==
��X Z
item
��[ _
.
��_ `
Id
��` b
)
��b c
;
��c d
}
�� 
vms
�� 
=
�� 
vms
�� 
.
�� 
OrderByDescending
�� +
(
��+ ,
x
��, -
=>
��. 0
x
��1 2
.
��2 3
Score
��3 8
)
��8 9
.
��9 :
ThenByDescending
��: J
(
��J K
x
��K L
=>
��M O
x
��P Q
.
��Q R

CreateDate
��R \
)
��\ ]
;
��] ^
result
�� 
=
�� 
new
�� #
OperationResultListVo
�� 2
<
��2 3%
BrainstormIdeaViewModel
��3 J
>
��J K
(
��K L
vms
��L O
)
��O P
;
��P Q
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� #
OperationResultListVo
�� 2
<
��2 3%
BrainstormIdeaViewModel
��3 J
>
��J K
(
��K L
ex
��L N
.
��N O
Message
��O V
)
��V W
;
��W X
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  
<
��  !%
BrainstormIdeaViewModel
��! 8
>
��8 9
GetById
��: A
(
��A B
Guid
��B F
userId
��G M
,
��M N
Guid
��O S
id
��T V
)
��V W
{
�� 	
OperationResultVo
�� 
<
�� %
BrainstormIdeaViewModel
�� 5
>
��5 6
result
��7 =
;
��= >
try
�� 
{
�� 
BrainstormIdea
�� 
model
�� $
=
��% &&
brainstormIdeaRepository
��' ?
.
��? @
GetById
��@ G
(
��G H
id
��H J
)
��J K
;
��K L%
BrainstormIdeaViewModel
�� '
vm
��( *
=
��+ ,
mapper
��- 3
.
��3 4
Map
��4 7
<
��7 8%
BrainstormIdeaViewModel
��8 O
>
��O P
(
��P Q
model
��Q V
)
��V W
;
��W X
vm
�� 
.
�� 
UserContentType
�� "
=
��# $
UserContentType
��% 4
.
��4 5

VotingItem
��5 ?
;
��? @
vm
�� 
.
�� 
	VoteCount
�� 
=
�� &
brainstormVoteRepository
�� 7
.
��7 8
Count
��8 =
(
��= >
x
��> ?
=>
��@ B
x
��C D
.
��D E
IdeaId
��E K
==
��L N
vm
��O Q
.
��Q R
Id
��R T
)
��T U
;
��U V
vm
�� 
.
�� 
Score
�� 
=
�� &
brainstormVoteRepository
�� 3
.
��3 4
GetAll
��4 :
(
��: ;
)
��; <
.
��< =
Where
��= B
(
��B C
x
��C D
=>
��E G
x
��H I
.
��I J
IdeaId
��J P
==
��Q S
vm
��T V
.
��V W
Id
��W Y
)
��Y Z
.
��Z [
Sum
��[ ^
(
��^ _
x
��_ `
=>
��a c
(
��d e
int
��e h
)
��h i
x
��i j
.
��j k
	VoteValue
��k t
)
��t u
;
��u v
vm
�� 
.
�� 
CurrentUserVote
�� "
=
��# $&
brainstormVoteRepository
��% =
.
��= >
GetAll
��> D
(
��D E
)
��E F
.
��F G
FirstOrDefault
��G U
(
��U V
x
��V W
=>
��X Z
x
��[ \
.
��\ ]
UserId
��] c
==
��d f
userId
��g m
&&
��n p
x
��q r
.
��r s
IdeaId
��s y
==
��z |
id
��} 
)�� �
?��� �
.��� �
	VoteValue��� �
??��� �
	VoteValue��� �
.��� �
Neutral��� �
;��� �
vm
�� 
.
�� 
CommentCount
�� 
=
��  !)
brainstormCommentRepository
��" =
.
��= >
GetAll
��> D
(
��D E
)
��E F
.
��F G
Count
��G L
(
��L M
x
��M N
=>
��O Q
x
��R S
.
��S T
IdeaId
��T Z
==
��[ ]
vm
��^ `
.
��` a
Id
��a c
)
��c d
;
��d e
IOrderedQueryable
�� !
<
��! "
BrainstormComment
��" 3
>
��3 4
comments
��5 =
=
��> ?)
brainstormCommentRepository
��@ [
.
��[ \
GetAll
��\ b
(
��b c
)
��c d
.
��d e
Where
��e j
(
��j k
x
��k l
=>
��m o
x
��p q
.
��q r
IdeaId
��r x
==
��y {
vm
��| ~
.
��~ 
Id�� �
)��� �
.��� �
OrderBy��� �
(��� �
x��� �
=>��� �
x��� �
.��� �

CreateDate��� �
)��� �
;��� �

IQueryable
�� 
<
�� (
BrainstormCommentViewModel
�� 5
>
��5 6

commentsVm
��7 A
=
��B C
comments
��D L
.
��L M
	ProjectTo
��M V
<
��V W(
BrainstormCommentViewModel
��W q
>
��q r
(
��r s
mapper
��s y
.
��y z$
ConfigurationProvider��z �
)��� �
;��� �
vm
�� 
.
�� 
Comments
�� 
=
�� 

commentsVm
�� (
.
��( )
ToList
��) /
(
��/ 0
)
��0 1
;
��1 2
foreach
�� 
(
�� (
BrainstormCommentViewModel
�� 3
comment
��4 ;
in
��< >
vm
��? A
.
��A B
Comments
��B J
)
��J K
{
�� 
comment
�� 
.
�� 

AuthorName
�� &
=
��' (
string
��) /
.
��/ 0 
IsNullOrWhiteSpace
��0 B
(
��B C
comment
��C J
.
��J K

AuthorName
��K U
)
��U V
?
��W X
$str
��Y g
:
��h i
comment
��j q
.
��q r

AuthorName
��r |
;
��| }
comment
�� 
.
�� 
AuthorPicture
�� )
=
��* +
UrlFormatter
��, 8
.
��8 9
ProfileImage
��9 E
(
��E F
comment
��F M
.
��M N
UserId
��N T
)
��T U
;
��U V
comment
�� 
.
�� 
Text
��  
=
��! "
string
��# )
.
��) * 
IsNullOrWhiteSpace
��* <
(
��< =
comment
��= D
.
��D E
Text
��E I
)
��I J
?
��K L
$str
��M q
:
��r s
comment
��t {
.
��{ |
Text��| �
;��� �
}
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /%
BrainstormIdeaViewModel
��/ F
>
��F G
(
��G H
vm
��H J
)
��J K
;
��K L
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /%
BrainstormIdeaViewModel
��/ F
>
��F G
(
��G H
ex
��H J
.
��J K
Message
��K R
)
��R S
;
��S T
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  
Vote
��! %
(
��% &
Guid
��& *
userId
��+ 1
,
��1 2
Guid
��3 7
ideaId
��8 >
,
��> ?
	VoteValue
��@ I
vote
��J N
)
��N O
{
�� 	
OperationResultVo
�� 
result
�� $
;
��$ %
try
�� 
{
�� 
BrainstormVote
�� 
model
�� $
;
��$ %
BrainstormVote
�� 
existing
�� '
=
��( )&
brainstormVoteRepository
��* B
.
��B C
Get
��C F
(
��F G
ideaId
��G M
,
��M N
userId
��O U
)
��U V
;
��V W
if
�� 
(
�� 
existing
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
model
�� 
=
�� 
existing
�� $
;
��$ %
model
�� 
.
�� 
	VoteValue
�� #
=
��$ %
vote
��& *
;
��* +
}
�� 
else
�� 
{
�� 
model
�� 
=
�� 
new
�� 
BrainstormVote
��  .
{
�� 
UserId
�� 
=
��  
userId
��! '
,
��' (
IdeaId
�� 
=
��  
ideaId
��! '
,
��' (
	VoteValue
�� !
=
��" #
vote
��$ (
}
�� 
;
�� 
}
�� 
if
�� 
(
�� 
model
�� 
.
�� 
Id
�� 
==
�� 
Guid
��  $
.
��$ %
Empty
��% *
)
��* +
{
�� &
brainstormVoteRepository
�� ,
.
��, -
Add
��- 0
(
��0 1
model
��1 6
)
��6 7
;
��7 8
}
�� 
else
�� 
{
�� &
brainstormVoteRepository
�� ,
.
��, -
Update
��- 3
(
��3 4
model
��4 9
)
��9 :
;
��: ;
}
�� 

unitOfWork
�� 
.
�� 
Commit
�� !
(
��! "
)
��" #
;
��# $
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
model
��5 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
ex
��5 7
.
��7 8
Message
��8 ?
)
��? @
;
��@ A
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  
Comment
��! (
(
��( ))
UserContentCommentViewModel
��) D
vm
��E G
)
��G H
{
�� 	
OperationResultVo
�� 
result
�� $
;
��$ %
try
�� 
{
�� 
BrainstormComment
�� !
model
��" '
=
��( )
new
��* -
BrainstormComment
��. ?
{
�� 
UserId
�� 
=
�� 
vm
�� 
.
��  
UserId
��  &
,
��& '
IdeaId
�� 
=
�� 
vm
�� 
.
��  
UserContentId
��  -
,
��- .
Text
�� 
=
�� 
vm
�� 
.
�� 
Text
�� "
,
��" #

AuthorName
�� 
=
��  
vm
��! #
.
��# $

AuthorName
��$ .
,
��. /
AuthorPicture
�� !
=
��" #
vm
��$ &
.
��& '
AuthorPicture
��' 4
}
�� 
;
�� )
brainstormCommentRepository
�� +
.
��+ ,
Add
��, /
(
��/ 0
model
��0 5
)
��5 6
;
��6 7

unitOfWork
�� 
.
�� 
Commit
�� !
(
��! "
)
��" #
;
��# $
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
model
��5 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
ex
��5 7
.
��7 8
Message
��8 ?
)
��? @
;
��@ A
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  
<
��  !(
BrainstormSessionViewModel
��! ;
>
��; <

GetSession
��= G
(
��G H
Guid
��H L
userId
��M S
,
��S T#
BrainstormSessionType
��U j
type
��k o
)
��o p
{
�� 	
OperationResultVo
�� 
<
�� (
BrainstormSessionViewModel
�� 8
>
��8 9
result
��: @
;
��@ A
try
�� 
{
�� 
BrainstormSession
�� !
model
��" '
=
��( ))
brainstormSessionRepository
��* E
.
��E F
GetAll
��F L
(
��L M
)
��M N
.
��N O
LastOrDefault
��O \
(
��\ ]
x
��] ^
=>
��_ a
x
��b c
.
��c d
Type
��d h
==
��i k
type
��l p
)
��p q
;
��q r(
BrainstormSessionViewModel
�� *
vm
��+ -
=
��. /
mapper
��0 6
.
��6 7
Map
��7 :
<
��: ;(
BrainstormSessionViewModel
��; U
>
��U V
(
��V W
model
��W \
)
��\ ]
;
��] ^
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /(
BrainstormSessionViewModel
��/ I
>
��I J
(
��J K
vm
��K M
)
��M N
;
��N O
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /(
BrainstormSessionViewModel
��/ I
>
��I J
(
��J K
ex
��K M
.
��M N
Message
��N U
)
��U V
;
��V W
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� #
OperationResultListVo
�� $
<
��$ %(
BrainstormSessionViewModel
��% ?
>
��? @
GetSessions
��A L
(
��L M
Guid
��M Q
userId
��R X
)
��X Y
{
�� 	#
OperationResultListVo
�� !
<
��! "(
BrainstormSessionViewModel
��" <
>
��< =
result
��> D
;
��D E
try
�� 
{
�� 

IQueryable
�� 
<
�� 
BrainstormSession
�� ,
>
��, -
model
��. 3
=
��4 5)
brainstormSessionRepository
��6 Q
.
��Q R
GetAll
��R X
(
��X Y
)
��Y Z
;
��Z [

IQueryable
�� 
<
�� (
BrainstormSessionViewModel
�� 5
>
��5 6
vms
��7 :
=
��; <
model
��= B
.
��B C
	ProjectTo
��C L
<
��L M(
BrainstormSessionViewModel
��M g
>
��g h
(
��h i
mapper
��i o
.
��o p$
ConfigurationProvider��p �
)��� �
;��� �
vms
�� 
=
�� 
vms
�� 
.
�� 
OrderBy
�� !
(
��! "
x
��" #
=>
��$ &
x
��' (
.
��( )
Type
��) -
)
��- .
.
��. /
ThenBy
��/ 5
(
��5 6
x
��6 7
=>
��8 :
x
��; <
.
��< =

CreateDate
��= G
)
��G H
;
��H I
result
�� 
=
�� 
new
�� #
OperationResultListVo
�� 2
<
��2 3(
BrainstormSessionViewModel
��3 M
>
��M N
(
��N O
vms
��O R
)
��R S
;
��S T
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� #
OperationResultListVo
�� 2
<
��2 3(
BrainstormSessionViewModel
��3 M
>
��M N
(
��N O
ex
��O Q
.
��Q R
Message
��R Y
)
��Y Z
;
��Z [
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  
<
��  !
Guid
��! %
>
��% &
SaveSession
��' 2
(
��2 3(
BrainstormSessionViewModel
��3 M
vm
��N P
)
��P Q
{
�� 	
OperationResultVo
�� 
<
�� 
Guid
�� "
>
��" #
result
��$ *
;
��* +
try
�� 
{
�� 
BrainstormSession
�� !
model
��" '
;
��' (
BrainstormSession
�� !
existing
��" *
=
��+ ,)
brainstormSessionRepository
��- H
.
��H I
GetById
��I P
(
��P Q
vm
��Q S
.
��S T
Id
��T V
)
��V W
;
��W X
if
�� 
(
�� 
existing
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
model
�� 
=
�� 
mapper
�� "
.
��" #
Map
��# &
(
��& '
vm
��' )
,
��) *
existing
��+ 3
)
��3 4
;
��4 5
}
�� 
else
�� 
{
�� 
model
�� 
=
�� 
mapper
�� "
.
��" #
Map
��# &
<
��& '
BrainstormSession
��' 8
>
��8 9
(
��9 :
vm
��: <
)
��< =
;
��= >
}
�� 
if
�� 
(
�� 
vm
�� 
.
�� 
Id
�� 
==
�� 
Guid
�� !
.
��! "
Empty
��" '
)
��' (
{
�� )
brainstormSessionRepository
�� /
.
��/ 0
Add
��0 3
(
��3 4
model
��4 9
)
��9 :
;
��: ;
vm
�� 
.
�� 
Id
�� 
=
�� 
model
�� !
.
��! "
Id
��" $
;
��$ %
}
�� 
else
�� 
{
�� )
brainstormSessionRepository
�� /
.
��/ 0
Update
��0 6
(
��6 7
model
��7 <
)
��< =
;
��= >
}
�� 

unitOfWork
�� 
.
�� 
Commit
�� !
(
��! "
)
��" #
;
��# $
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
model
��5 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
ex
��5 7
.
��7 8
Message
��8 ?
)
��? @
;
��@ A
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� #
OperationResultListVo
�� $
<
��$ %%
BrainstormIdeaViewModel
��% <
>
��< =
GetAllBySessionId
��> O
(
��O P
Guid
��P T
userId
��U [
,
��[ \
Guid
��] a
	sessionId
��b k
)
��k l
{
�� 	#
OperationResultListVo
�� !
<
��! "%
BrainstormIdeaViewModel
��" 9
>
��9 :
result
��; A
;
��A B
try
�� 
{
�� 

IQueryable
�� 
<
�� 
BrainstormIdea
�� )
>
��) *
	allModels
��+ 4
=
��5 6&
brainstormIdeaRepository
��7 O
.
��O P
GetAll
��P V
(
��V W
)
��W X
.
��X Y
Where
��Y ^
(
��^ _
x
��_ `
=>
��a c
x
��d e
.
��e f
	SessionId
��f o
==
��p r
	sessionId
��s |
)
��| }
;
��} ~

IQueryable
�� 
<
�� 
BrainstormVote
�� )
>
��) *
currentUserVotes
��+ ;
=
��< =&
brainstormVoteRepository
��> V
.
��V W
GetByUserId
��W b
(
��b c
userId
��c i
)
��i j
;
��j k
IEnumerable
�� 
<
�� %
BrainstormIdeaViewModel
�� 3
>
��3 4
vms
��5 8
=
��9 :
mapper
��; A
.
��A B
Map
��B E
<
��E F
IEnumerable
��F Q
<
��Q R
BrainstormIdea
��R `
>
��` a
,
��a b
IEnumerable
��c n
<
��n o&
BrainstormIdeaViewModel��o �
>��� �
>��� �
(��� �
	allModels��� �
)��� �
;��� �
foreach
�� 
(
�� %
BrainstormIdeaViewModel
�� 0
item
��1 5
in
��6 8
vms
��9 <
)
��< =
{
�� 
item
�� 
.
�� 
UserContentType
�� (
=
��) *
UserContentType
��+ :
.
��: ;

VotingItem
��; E
;
��E F
item
�� 
.
�� 
	VoteCount
�� "
=
��# $&
brainstormVoteRepository
��% =
.
��= >
Count
��> C
(
��C D
x
��D E
=>
��F H
x
��I J
.
��J K
IdeaId
��K Q
==
��R T
item
��U Y
.
��Y Z
Id
��Z \
)
��\ ]
;
��] ^
item
�� 
.
�� 
Score
�� 
=
��  &
brainstormVoteRepository
��! 9
.
��9 :
GetAll
��: @
(
��@ A
)
��A B
.
��B C
Where
��C H
(
��H I
x
��I J
=>
��K M
x
��N O
.
��O P
IdeaId
��P V
==
��W Y
item
��Z ^
.
��^ _
Id
��_ a
)
��a b
.
��b c
Sum
��c f
(
��f g
x
��g h
=>
��i k
(
��l m
int
��m p
)
��p q
x
��q r
.
��r s
	VoteValue
��s |
)
��| }
;
��} ~
item
�� 
.
�� 
CurrentUserVote
�� (
=
��) *
currentUserVotes
��+ ;
.
��; <
FirstOrDefault
��< J
(
��J K
x
��K L
=>
��M O
x
��P Q
.
��Q R
IdeaId
��R X
==
��Y [
item
��\ `
.
��` a
Id
��a c
)
��c d
?
��d e
.
��e f
	VoteValue
��f o
??
��p r
	VoteValue
��s |
.
��| }
Neutral��} �
;��� �
item
�� 
.
�� 
CommentCount
�� %
=
��& ')
brainstormCommentRepository
��( C
.
��C D
Count
��D I
(
��I J
x
��J K
=>
��L N
x
��O P
.
��P Q
IdeaId
��Q W
==
��X Z
item
��[ _
.
��_ `
Id
��` b
)
��b c
;
��c d
}
�� 
vms
�� 
=
�� 
vms
�� 
.
�� 
OrderByDescending
�� +
(
��+ ,
x
��, -
=>
��. 0
x
��1 2
.
��2 3
Score
��3 8
)
��8 9
.
��9 :
ThenByDescending
��: J
(
��J K
x
��K L
=>
��M O
x
��P Q
.
��Q R

CreateDate
��R \
)
��\ ]
;
��] ^
result
�� 
=
�� 
new
�� #
OperationResultListVo
�� 2
<
��2 3%
BrainstormIdeaViewModel
��3 J
>
��J K
(
��K L
vms
��L O
)
��O P
;
��P Q
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� #
OperationResultListVo
�� 2
<
��2 3%
BrainstormIdeaViewModel
��3 J
>
��J K
(
��K L
ex
��L N
.
��N O
Message
��O V
)
��V W
;
��W X
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
vC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Services\FeaturedContentAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #
Services# +
{ 
public 

class %
FeaturedContentAppService *
:+ ,
BaseAppService- ;
,; <&
IFeaturedContentAppService= W
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly &
IFeaturedContentRepository 3
_repository4 ?
;? @
private 
readonly "
IUserContentRepository /
_contentRepository0 B
;B C
private 
readonly &
IUserContentLikeRepository 3
_likeRepository4 C
;C D
private 
readonly )
IUserContentCommentRepository 6
_commentRepository7 I
;I J
public 
Guid 
CurrentUserId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public %
FeaturedContentAppService (
(( )
IMapper) 0
mapper1 7
,7 8
IUnitOfWork9 D

unitOfWorkE O
,O P&
IFeaturedContentRepositoryQ k

repositoryl v
,v w#
IUserContentRepository	x �
contentRepository
� �
,
� �(
IUserContentLikeRepository
� �
likeRepository
� �
,
� �+
IUserContentCommentRepository
� �
commentRepository
� �
)
� �
{ 	
_mapper   
=   
mapper   
;   
_unitOfWork!! 
=!! 

unitOfWork!! $
;!!$ %
_repository"" 
="" 

repository"" $
;""$ %
_contentRepository## 
=##  
contentRepository##! 2
;##2 3
_likeRepository$$ 
=$$ 
likeRepository$$ ,
;$$, -
_commentRepository%% 
=%%  
commentRepository%%! 2
;%%2 3
}&& 	
public(( 
OperationResultVo((  
<((  !
int((! $
>(($ %
Count((& +
(((+ ,
)((, -
{)) 	
OperationResultVo** 
<** 
int** !
>**! "
result**# )
;**) *
try,, 
{-- 
int.. 
count.. 
=.. 
_repository.. '
...' (
GetAll..( .
(... /
)../ 0
...0 1
Count..1 6
(..6 7
)..7 8
;..8 9
result00 
=00 
new00 
OperationResultVo00 .
<00. /
int00/ 2
>002 3
(003 4
count004 9
)009 :
;00: ;
}11 
catch22 
(22 
	Exception22 
ex22 
)22  
{33 
result44 
=44 
new44 
OperationResultVo44 .
<44. /
int44/ 2
>442 3
(443 4
ex444 6
.446 7
Message447 >
)44> ?
;44? @
}55 
return77 
result77 
;77 
}88 	
public:: !
OperationResultListVo:: $
<::$ %$
FeaturedContentViewModel::% =
>::= >
GetAll::? E
(::E F
)::F G
{;; 	!
OperationResultListVo<< !
<<<! "$
FeaturedContentViewModel<<" :
><<: ;
result<<< B
;<<B C
try>> 
{?? 

IQueryable@@ 
<@@ 
FeaturedContent@@ *
>@@* +
	allModels@@, 5
=@@6 7
_repository@@8 C
.@@C D
GetAll@@D J
(@@J K
)@@K L
;@@L M
IEnumerableBB 
<BB $
FeaturedContentViewModelBB 4
>BB4 5
vmsBB6 9
=BB: ;
_mapperBB< C
.BBC D
MapBBD G
<BBG H
IEnumerableBBH S
<BBS T
FeaturedContentBBT c
>BBc d
,BBd e
IEnumerableBBf q
<BBq r%
FeaturedContentViewModel	BBr �
>
BB� �
>
BB� �
(
BB� �
	allModels
BB� �
)
BB� �
;
BB� �
resultDD 
=DD 
newDD !
OperationResultListVoDD 2
<DD2 3$
FeaturedContentViewModelDD3 K
>DDK L
(DDL M
vmsDDM P
)DDP Q
;DDQ R
}EE 
catchFF 
(FF 
	ExceptionFF 
exFF 
)FF  
{GG 
resultHH 
=HH 
newHH !
OperationResultListVoHH 2
<HH2 3$
FeaturedContentViewModelHH3 K
>HHK L
(HHL M
exHHM O
.HHO P
MessageHHP W
)HHW X
;HHX Y
}II 
returnKK 
resultKK 
;KK 
}LL 	
publicNN 
OperationResultVoNN  
<NN  !$
FeaturedContentViewModelNN! 9
>NN9 :
GetByIdNN; B
(NNB C
GuidNNC G
idNNH J
)NNJ K
{OO 	
OperationResultVoPP 
<PP $
FeaturedContentViewModelPP 6
>PP6 7
resultPP8 >
;PP> ?
tryRR 
{SS 
FeaturedContentTT 
modelTT  %
=TT& '
_repositoryTT( 3
.TT3 4
GetByIdTT4 ;
(TT; <
idTT< >
)TT> ?
;TT? @$
FeaturedContentViewModelVV (
vmVV) +
=VV, -
_mapperVV. 5
.VV5 6
MapVV6 9
<VV9 :$
FeaturedContentViewModelVV: R
>VVR S
(VVS T
modelVVT Y
)VVY Z
;VVZ [
resultXX 
=XX 
newXX 
OperationResultVoXX .
<XX. /$
FeaturedContentViewModelXX/ G
>XXG H
(XXH I
vmXXI K
)XXK L
;XXL M
}YY 
catchZZ 
(ZZ 
	ExceptionZZ 
exZZ 
)ZZ  
{[[ 
result\\ 
=\\ 
new\\ 
OperationResultVo\\ .
<\\. /$
FeaturedContentViewModel\\/ G
>\\G H
(\\H I
ex\\I K
.\\K L
Message\\L S
)\\S T
;\\T U
}]] 
return__ 
result__ 
;__ 
}`` 	
publicbb 
OperationResultVobb  
Removebb! '
(bb' (
Guidbb( ,
idbb- /
)bb/ 0
{cc 	
OperationResultVodd 
resultdd $
;dd$ %
tryff 
{gg 
_repositoryjj 
.jj 
Removejj "
(jj" #
idjj# %
)jj% &
;jj& '
_unitOfWorkll 
.ll 
Commitll "
(ll" #
)ll# $
;ll$ %
resultnn 
=nn 
newnn 
OperationResultVonn .
(nn. /
truenn/ 3
)nn3 4
;nn4 5
}oo 
catchpp 
(pp 
	Exceptionpp 
expp 
)pp  
{qq 
resultrr 
=rr 
newrr 
OperationResultVorr .
(rr. /
exrr/ 1
.rr1 2
Messagerr2 9
)rr9 :
;rr: ;
}ss 
returnuu 
resultuu 
;uu 
}vv 	
publicxx 
OperationResultVoxx  
<xx  !
Guidxx! %
>xx% &
Savexx' +
(xx+ ,$
FeaturedContentViewModelxx, D
	viewModelxxE N
)xxN O
{yy 	
OperationResultVozz 
<zz 
Guidzz "
>zz" #
resultzz$ *
;zz* +
try|| 
{}} 
FeaturedContent~~ 
model~~  %
;~~% &
FeaturedContent
�� 
existing
��  (
=
��) *
_repository
��+ 6
.
��6 7
GetById
��7 >
(
��> ?
	viewModel
��? H
.
��H I
Id
��I K
)
��K L
;
��L M
if
�� 
(
�� 
existing
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
model
�� 
=
�� 
_mapper
�� #
.
��# $
Map
��$ '
(
��' (
	viewModel
��( 1
,
��1 2
existing
��3 ;
)
��; <
;
��< =
}
�� 
else
�� 
{
�� 
model
�� 
=
�� 
_mapper
�� #
.
��# $
Map
��$ '
<
��' (
FeaturedContent
��( 7
>
��7 8
(
��8 9
	viewModel
��9 B
)
��B C
;
��C D
}
�� 
if
�� 
(
�� 
	viewModel
�� 
.
�� 
Id
��  
==
��! #
Guid
��$ (
.
��( )
Empty
��) .
)
��. /
{
�� 
_repository
�� 
.
��  
Add
��  #
(
��# $
model
��$ )
)
��) *
;
��* +
	viewModel
�� 
.
�� 
Id
��  
=
��! "
model
��# (
.
��( )
Id
��) +
;
��+ ,
}
�� 
else
�� 
{
�� 
_repository
�� 
.
��  
Update
��  &
(
��& '
model
��' ,
)
��, -
;
��- .
}
�� 
_unitOfWork
�� 
.
�� 
Commit
�� "
(
��" #
)
��# $
;
��$ %
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
model
��5 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
ex
��5 7
.
��7 8
Message
��8 ?
)
��? @
;
��@ A
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
CarouselViewModel
��  
GetFeaturedNow
��! /
(
��/ 0
)
��0 1
{
�� 	

IQueryable
�� 
<
�� 
FeaturedContent
�� &
>
��& '
	allModels
��( 1
=
��2 3
_repository
��4 ?
.
��? @
GetAll
��@ F
(
��F G
)
��G H
.
�� 
Where
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
�� 
	StartDate
�� '
.
��' (
Date
��( ,
<=
��- /
DateTime
��0 8
.
��8 9
Today
��9 >
&&
��? A
(
��B C
x
��C D
.
��D E
EndDate
��E L
.
��L M
Date
��M Q
==
��R T
DateTime
��U ]
.
��] ^
MinValue
��^ f
||
��g i
x
��j k
.
��k l
EndDate
��l s
.
��s t
Date
��t x
>
��y z
DateTime��{ �
.��� �
Today��� �
)��� �
)��� �
;��� �
if
�� 
(
�� 
	allModels
�� 
.
�� 
Any
�� 
(
�� 
)
�� 
)
��  
{
�� 
IEnumerable
�� 
<
�� &
FeaturedContentViewModel
�� 4
>
��4 5
vms
��6 9
=
��: ;
_mapper
��< C
.
��C D
Map
��D G
<
��G H
IEnumerable
��H S
<
��S T
FeaturedContent
��T c
>
��c d
,
��d e
IEnumerable
��f q
<
��q r'
FeaturedContentViewModel��r �
>��� �
>��� �
(��� �
	allModels��� �
)��� �
;��� �
CarouselViewModel
�� !
model
��" '
=
��( )
new
��* -
CarouselViewModel
��. ?
(
��? @
)
��@ A
;
��A B
model
�� 
.
�� 
Items
�� 
=
�� 
vms
�� !
.
��! "
ToList
��" (
(
��( )
)
��) *
;
��* +
return
�� 
model
�� 
;
�� 
}
�� 
else
�� 
{
�� 
CarouselViewModel
�� !
fake
��" &
=
��' (
FakeData
��) 1
.
��1 2
FakeCarousel
��2 >
(
��> ?
)
��? @
;
��@ A
return
�� 
fake
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
OperationResultVo
��  
<
��  !
Guid
��! %
>
��% &
Add
��' *
(
��* +
Guid
��+ /
userId
��0 6
,
��6 7
Guid
��8 <
	contentId
��= F
,
��F G
string
��H N
title
��O T
,
��T U
string
��V \
introduction
��] i
)
��i j
{
�� 	
OperationResultVo
�� 
<
�� 
Guid
�� "
>
��" #
result
��$ *
;
��* +
try
�� 
{
�� 
FeaturedContent
��  
newFeaturedContent
��  2
=
��3 4
new
��5 8
FeaturedContent
��9 H
(
��H I
)
��I J
;
��J K 
newFeaturedContent
�� "
.
��" #
UserContentId
��# 0
=
��1 2
	contentId
��3 <
;
��< =
UserContent
�� 
content
�� #
=
��$ % 
_contentRepository
��& 8
.
��8 9
GetById
��9 @
(
��@ A
	contentId
��A J
)
��J K
;
��K L 
newFeaturedContent
�� "
.
��" #
Title
��# (
=
��) *
string
��+ 1
.
��1 2 
IsNullOrWhiteSpace
��2 D
(
��D E
title
��E J
)
��J K
?
��L M
content
��N U
.
��U V
Title
��V [
:
��\ ]
title
��^ c
;
��c d 
newFeaturedContent
�� "
.
��" #
Introduction
��# /
=
��0 1
string
��2 8
.
��8 9 
IsNullOrWhiteSpace
��9 K
(
��K L
introduction
��L X
)
��X Y
?
��Z [
content
��\ c
.
��c d
Introduction
��d p
:
��q r
introduction
��s 
;�� � 
newFeaturedContent
�� "
.
��" #
ImageUrl
��# +
=
��, -
string
��. 4
.
��4 5 
IsNullOrWhiteSpace
��5 G
(
��G H
content
��H O
.
��O P
FeaturedImage
��P ]
)
��] ^
||
��_ a
content
��b i
.
��i j
FeaturedImage
��j w
.
��w x
Equals
��x ~
(
��~ 
	Constants�� �
.��� �$
DefaultFeaturedImage��� �
)��� �
?��� �
	Constants��� �
.��� �$
DefaultFeaturedImage��� �
:��� �
UrlFormatter��� �
.��� �
Image��� �
(��� �
content��� �
.��� �
UserId��� �
,��� �
BlobType��� �
.��� �
FeaturedImage��� �
,��� �
content��� �
.��� �
FeaturedImage��� �
)��� �
;��� � 
newFeaturedContent
�� "
.
��" #
	StartDate
��# ,
=
��- .
DateTime
��/ 7
.
��7 8
Now
��8 ;
;
��; < 
newFeaturedContent
�� "
.
��" #
Active
��# )
=
��* +
true
��, 0
;
��0 1 
newFeaturedContent
�� "
.
��" #
UserId
��# )
=
��* +
userId
��, 2
;
��2 3
_repository
�� 
.
�� 
Add
�� 
(
��   
newFeaturedContent
��  2
)
��2 3
;
��3 4
_unitOfWork
�� 
.
�� 
Commit
�� "
(
��" #
)
��# $
;
��$ %
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5 
newFeaturedContent
��5 G
.
��G H
Id
��H J
)
��J K
;
��K L
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
ex
��5 7
.
��7 8
Message
��8 ?
)
��? @
;
��@ A
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
IEnumerable
�� 
<
�� .
 UserContentToBeFeaturedViewModel
�� ;
>
��; <$
GetContentToBeFeatured
��= S
(
��S T
)
��T U
{
�� 	

IQueryable
�� 
<
�� 
UserContent
�� "
>
��" #
	finalList
��$ -
=
��. / 
_contentRepository
��0 B
.
��B C
GetAll
��C I
(
��I J
)
��J K
;
��K L
List
�� 
<
�� .
 UserContentToBeFeaturedViewModel
�� 1
>
��1 2

viewModels
��3 =
=
��> ?
	finalList
��@ I
.
��I J
	ProjectTo
��J S
<
��S T.
 UserContentToBeFeaturedViewModel
��T t
>
��t u
(
��u v
_mapper
��v }
.
��} ~$
ConfigurationProvider��~ �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
foreach
�� 
(
�� .
 UserContentToBeFeaturedViewModel
�� 5
item
��6 :
in
��; =

viewModels
��> H
)
��H I
{
�� 
FeaturedContent
�� 
featuredNow
��  +
=
��, -
_repository
��. 9
.
��9 :
GetAll
��: @
(
��@ A
)
��A B
.
��B C
FirstOrDefault
��C Q
(
��Q R
x
��R S
=>
��T V
x
��W X
.
��X Y
UserContentId
��Y f
==
��g i
item
��j n
.
��n o
Id
��o q
&&
��r t
x
��u v
.
��v w
	StartDate��w �
.��� �
Date��� �
<=��� �
DateTime��� �
.��� �
Today��� �
&&��� �
(��� �
x��� �
.��� �
EndDate��� �
.��� �
Date��� �
==��� �
null��� �
||��� �
x��� �
.��� �
EndDate��� �
.��� �
Date��� �
==��� �
DateTime��� �
.��� �
MinValue��� �
||��� �
x��� �
.��� �
EndDate��� �
.��� �
Date��� �
>��� �
DateTime��� �
.��� �
Today��� �
)��� �
)��� �
;��� �
if
�� 
(
�� 
featuredNow
�� 
!=
��  "
null
��# '
)
��' (
{
�� 
item
�� 
.
�� 
CurrentFeatureId
�� )
=
��* +
featuredNow
��, 7
.
��7 8
Id
��8 :
;
��: ;
}
�� 
item
�� 
.
�� 

IsFeatured
�� 
=
��  !
item
��" &
.
��& '
CurrentFeatureId
��' 7
.
��7 8
HasValue
��8 @
;
��@ A
item
�� 
.
�� 

AuthorName
�� 
=
��  !
string
��" (
.
��( ) 
IsNullOrWhiteSpace
��) ;
(
��; <
item
��< @
.
��@ A

AuthorName
��A K
)
��K L
?
��M N
$str
��O ]
:
��^ _
item
��` d
.
��d e

AuthorName
��e o
;
��o p
item
�� 
.
�� 
TitleCompliant
�� #
=
��$ %
!
��& '
string
��' -
.
��- . 
IsNullOrWhiteSpace
��. @
(
��@ A
item
��A E
.
��E F
Title
��F K
)
��K L
&&
��M O
item
��P T
.
��T U
Title
��U Z
.
��Z [
Length
��[ a
<=
��b d
$num
��e g
;
��g h
item
�� 
.
�� 
IntroCompliant
�� #
=
��$ %
!
��& '
string
��' -
.
��- . 
IsNullOrWhiteSpace
��. @
(
��@ A
item
��A E
.
��E F
Introduction
��F R
)
��R S
&&
��T V
item
��W [
.
��[ \
Introduction
��\ h
.
��h i
Length
��i o
<=
��p r
$num
��s u
;
��u v
item
�� 
.
�� 
ContentCompliant
�� %
=
��& '
!
��( )
string
��) /
.
��/ 0 
IsNullOrWhiteSpace
��0 B
(
��B C
item
��C G
.
��G H
Content
��H O
)
��O P
&&
��Q S
item
��T X
.
��X Y
Content
��Y `
.
��` a
Length
��a g
>=
��h j
$num
��k n
;
��n o
item
�� 
.
�� 
	IsArticle
�� 
=
��  
!
��! "
string
��" (
.
��( ) 
IsNullOrWhiteSpace
��) ;
(
��; <
item
��< @
.
��@ A
Title
��A F
)
��F G
&&
��H J
!
��K L
string
��L R
.
��R S 
IsNullOrWhiteSpace
��S e
(
��e f
item
��f j
.
��j k
Introduction
��k w
)
��w x
;
��x y
item
�� 
.
�� 
	LikeCount
�� 
=
��  
_likeRepository
��! 0
.
��0 1
GetAll
��1 7
(
��7 8
)
��8 9
.
��9 :
Count
��: ?
(
��? @
x
��@ A
=>
��B D
x
��E F
.
��F G
	ContentId
��G P
==
��Q S
item
��T X
.
��X Y
Id
��Y [
)
��[ \
;
��\ ]
item
�� 
.
�� 
CommentCount
�� !
=
��" # 
_commentRepository
��$ 6
.
��6 7
GetAll
��7 =
(
��= >
)
��> ?
.
��? @
Count
��@ E
(
��E F
x
��F G
=>
��H J
x
��K L
.
��L M
UserContentId
��M Z
==
��[ ]
item
��^ b
.
��b c
Id
��c e
)
��e f
;
��f g
}
�� 

viewModels
�� 
=
�� 

viewModels
�� #
.
��# $
OrderByDescending
��$ 5
(
��5 6
x
��6 7
=>
��8 :
x
��; <
.
��< =

IsFeatured
��= G
)
��G H
.
��H I
ToList
��I O
(
��O P
)
��P Q
;
��Q R
return
�� 

viewModels
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  
	Unfeature
��! *
(
��* +
Guid
��+ /
id
��0 2
)
��2 3
{
�� 	
OperationResultVo
�� 
result
�� $
;
��$ %
try
�� 
{
�� 
FeaturedContent
�� 
existing
��  (
=
��) *
_repository
��+ 6
.
��6 7
GetById
��7 >
(
��> ?
id
��? A
)
��A B
;
��B C
if
�� 
(
�� 
existing
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
existing
�� 
.
�� 
EndDate
�� $
=
��% &
DateTime
��' /
.
��/ 0
Now
��0 3
;
��3 4
existing
�� 
.
�� 
Active
�� #
=
��$ %
false
��& +
;
��+ ,
_unitOfWork
�� 
.
��  
Commit
��  &
(
��& '
)
��' (
;
��( )
}
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
(
��. /
true
��/ 3
)
��3 4
;
��4 5
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
(
��. /
ex
��/ 1
.
��1 2
Message
��2 9
)
��9 :
;
��: ;
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
}
�� 
}�� �u
mC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Services\FollowAppService.cs
	namespace

 	
IndieVisible


 
.

 
Application

 "
.

" #
Services

# +
{ 
public 

class 
FollowAppService !
:" #
BaseAppService$ 2
,2 3
IFollowAppService4 E
{ 
private 
readonly 
IMapper  
mapper! '
;' (
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
private 
readonly $
IGameFollowDomainService 1#
gameFollowDomainService2 I
;I J
private 
readonly $
IUserFollowDomainService 1#
userFollowDomainService2 I
;I J
public 
FollowAppService 
(  
IMapper  '
mapper( .
,. /
IUnitOfWork0 ;

unitOfWork< F
, $
IGameFollowDomainService &#
gameFollowDomainService' >
, $
IUserFollowDomainService &#
userFollowDomainService' >
)> ?
{ 	
this 
. 
mapper 
= 
mapper  
;  !
this 
. 

unitOfWork 
= 

unitOfWork (
;( )
this 
. #
gameFollowDomainService (
=) *#
gameFollowDomainService+ B
;B C
this 
. #
userFollowDomainService (
=) *#
userFollowDomainService+ B
;B C
} 	
public 
OperationResultVo  

GameFollow! +
(+ ,
Guid, 0
userId1 7
,7 8
Guid9 =
gameId> D
)D E
{ 	
OperationResultVo   
response   &
;  & '
if"" 
("" 
userId"" 
=="" 
Guid"" 
."" 
Empty"" $
)""$ %
{## 
response$$ 
=$$ 
new$$ 
OperationResultVo$$ 0
($$0 1
$str$$1 Y
)$$Y Z
;$$Z [
}%% 
else&& 
{'' 
bool(( 
alreadyLiked(( !
=((" ##
gameFollowDomainService(($ ;
.((; <
GetAll((< B
(((B C
)((C D
.((D E
Any((E H
(((H I
x((I J
=>((K M
x((N O
.((O P
GameId((P V
==((W Y
gameId((Z `
&&((a c
x((d e
.((e f
UserId((f l
==((m o
userId((p v
)((v w
;((w x
if** 
(** 
alreadyLiked**  
)**  !
{++ 
response,, 
=,, 
new,, "
OperationResultVo,,# 4
(,,4 5
false,,5 :
),,: ;
;,,; <
response-- 
.-- 
Message-- $
=--% &
$str--' >
;--> ?
}.. 
else// 
{00 

GameFollow11 
model11 $
=11% &
new11' *

GameFollow11+ 5
(115 6
)116 7
;117 8
model33 
.33 
GameId33  
=33! "
gameId33# )
;33) *
model44 
.44 
UserId44  
=44! "
userId44# )
;44) *
this66 
.66 #
gameFollowDomainService66 0
.660 1
Add661 4
(664 5
model665 :
)66: ;
;66; <

unitOfWork88 
.88 
Commit88 %
(88% &
)88& '
;88' (
int:: 
newCount::  
=::! "
this::# '
.::' (#
gameFollowDomainService::( ?
.::? @
Count::@ E
(::E F
x::F G
=>::H J
x::K L
.::L M
GameId::M S
==::T V
gameId::W ]
)::] ^
;::^ _
response<< 
=<< 
new<< "
OperationResultVo<<# 4
<<<4 5
int<<5 8
><<8 9
(<<9 :
newCount<<: B
)<<B C
;<<C D
}== 
}>> 
return@@ 
response@@ 
;@@ 
}AA 	
publicCC 
OperationResultVoCC  
GameUnfollowCC! -
(CC- .
GuidCC. 2
userIdCC3 9
,CC9 :
GuidCC; ?
gameIdCC@ F
)CCF G
{DD 	
OperationResultVoEE 
responseEE &
;EE& '
ifGG 
(GG 
userIdGG 
==GG 
GuidGG 
.GG 
EmptyGG $
)GG$ %
{HH 
responseII 
=II 
newII 
OperationResultVoII 0
(II0 1
$strII1 [
)II[ \
;II\ ]
}JJ 
elseKK 
{LL 

GameFollowNN 
existingLikeNN '
=NN( )
thisNN* .
.NN. /#
gameFollowDomainServiceNN/ F
.NNF G
GetAllNNG M
(NNM N
)NNN O
.NNO P
FirstOrDefaultNNP ^
(NN^ _
xNN_ `
=>NNa c
xNNd e
.NNe f
GameIdNNf l
==NNm o
gameIdNNp v
&&NNw y
xNNz {
.NN{ |
UserId	NN| �
==
NN� �
userId
NN� �
)
NN� �
;
NN� �
ifPP 
(PP 
existingLikePP  
==PP! #
nullPP$ (
)PP( )
{QQ 
responseRR 
=RR 
newRR "
OperationResultVoRR# 4
(RR4 5
falseRR5 :
)RR: ;
;RR; <
responseSS 
.SS 
MessageSS $
=SS% &
$strSS' I
;SSI J
}TT 
elseUU 
{VV 
thisWW 
.WW 
RemoveGameFollowWW )
(WW) *
existingLikeWW* 6
.WW6 7
IdWW7 9
)WW9 :
;WW: ;

unitOfWorkYY 
.YY 
CommitYY %
(YY% &
)YY& '
;YY' (
int[[ 
newCount[[  
=[[! "
this[[# '
.[[' (#
gameFollowDomainService[[( ?
.[[? @
Count[[@ E
([[E F
x[[F G
=>[[H J
x[[K L
.[[L M
GameId[[M S
==[[T V
gameId[[W ]
)[[] ^
;[[^ _
response]] 
=]] 
new]] "
OperationResultVo]]# 4
<]]4 5
int]]5 8
>]]8 9
(]]9 :
newCount]]: B
)]]B C
;]]C D
}^^ 
}__ 
returnaa 
responseaa 
;aa 
}bb 	
privatedd 
OperationResultVodd !
RemoveGameFollowdd" 2
(dd2 3
Guiddd3 7
iddd8 :
)dd: ;
{ee 	
OperationResultVoff 
resultff $
;ff$ %
tryhh 
{ii 
thisll 
.ll #
gameFollowDomainServicell ,
.ll, -
Removell- 3
(ll3 4
idll4 6
)ll6 7
;ll7 8

unitOfWorknn 
.nn 
Commitnn !
(nn! "
)nn" #
;nn# $
resultpp 
=pp 
newpp 
OperationResultVopp .
(pp. /
truepp/ 3
)pp3 4
;pp4 5
}qq 
catchrr 
(rr 
	Exceptionrr 
exrr 
)rr  
{ss 
resulttt 
=tt 
newtt 
OperationResultVott .
(tt. /
extt/ 1
.tt1 2
Messagett2 9
)tt9 :
;tt: ;
}uu 
returnww 
resultww 
;ww 
}xx 	
public|| 
OperationResultVo||  

UserFollow||! +
(||+ ,
Guid||, 0
userId||1 7
,||7 8
Guid||9 =
followUserId||> J
)||J K
{}} 	
OperationResultVo~~ 
response~~ &
;~~& '
if
�� 
(
�� 
userId
�� 
==
�� 
Guid
�� 
.
�� 
Empty
�� $
)
��$ %
{
�� 
response
�� 
=
�� 
new
�� 
OperationResultVo
�� 0
(
��0 1
$str
��1 Y
)
��Y Z
;
��Z [
}
�� 
else
�� 
{
�� 
bool
�� 
alreadyLiked
�� !
=
��" #%
userFollowDomainService
��$ ;
.
��; <
GetAll
��< B
(
��B C
)
��C D
.
��D E
Any
��E H
(
��H I
x
��I J
=>
��K M
x
��N O
.
��O P
UserId
��P V
==
��W Y
userId
��Z `
&&
��a c
x
��d e
.
��e f
FollowUserId
��f r
==
��s u
followUserId��v �
)��� �
;��� �
if
�� 
(
�� 
alreadyLiked
��  
)
��  !
{
�� 
response
�� 
=
�� 
new
�� "
OperationResultVo
��# 4
(
��4 5
false
��5 :
)
��: ;
;
��; <
response
�� 
.
�� 
Message
�� $
=
��% &
$str
��' >
;
��> ?
}
�� 
else
�� 
{
�� 

UserFollow
�� 
model
�� $
=
��% &
new
��' *

UserFollow
��+ 5
(
��5 6
)
��6 7
;
��7 8
model
�� 
.
�� 
FollowUserId
�� &
=
��' (
followUserId
��) 5
;
��5 6
model
�� 
.
�� 
UserId
��  
=
��! "
userId
��# )
;
��) *
this
�� 
.
�� %
userFollowDomainService
�� 0
.
��0 1
Add
��1 4
(
��4 5
model
��5 :
)
��: ;
;
��; <

unitOfWork
�� 
.
�� 
Commit
�� %
(
��% &
)
��& '
;
��' (
int
�� 
newCount
��  
=
��! "
this
��# '
.
��' (%
userFollowDomainService
��( ?
.
��? @
Count
��@ E
(
��E F
x
��F G
=>
��H J
x
��K L
.
��L M
FollowUserId
��M Y
==
��Z \
followUserId
��] i
)
��i j
;
��j k
response
�� 
=
�� 
new
�� "
OperationResultVo
��# 4
<
��4 5
int
��5 8
>
��8 9
(
��9 :
newCount
��: B
)
��B C
;
��C D
}
�� 
}
�� 
return
�� 
response
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  
UserUnfollow
��! -
(
��- .
Guid
��. 2
userId
��3 9
,
��9 :
Guid
��; ?
followUserId
��@ L
)
��L M
{
�� 	
OperationResultVo
�� 
response
�� &
;
��& '
if
�� 
(
�� 
userId
�� 
==
�� 
Guid
�� 
.
�� 
Empty
�� $
)
��$ %
{
�� 
response
�� 
=
�� 
new
�� 
OperationResultVo
�� 0
(
��0 1
$str
��1 \
)
��\ ]
;
��] ^
}
�� 
else
�� 
{
�� 

UserFollow
�� 
existingLike
�� '
=
��( )
this
��* .
.
��. /%
userFollowDomainService
��/ F
.
��F G
GetAll
��G M
(
��M N
)
��N O
.
��O P
FirstOrDefault
��P ^
(
��^ _
x
��_ `
=>
��a c
x
��d e
.
��e f
UserId
��f l
==
��m o
userId
��p v
&&
��w y
x
��z {
.
��{ |
FollowUserId��| �
==��� �
followUserId��� �
)��� �
;��� �
if
�� 
(
�� 
existingLike
��  
==
��! #
null
��$ (
)
��( )
{
�� 
response
�� 
=
�� 
new
�� "
OperationResultVo
��# 4
(
��4 5
false
��5 :
)
��: ;
;
��; <
response
�� 
.
�� 
Message
�� $
=
��% &
$str
��' I
;
��I J
}
�� 
else
�� 
{
�� 
this
�� 
.
�� !
RemoveProfileFollow
�� ,
(
��, -
existingLike
��- 9
.
��9 :
Id
��: <
)
��< =
;
��= >

unitOfWork
�� 
.
�� 
Commit
�� %
(
��% &
)
��& '
;
��' (
int
�� 
newCount
��  
=
��! "
this
��# '
.
��' (%
userFollowDomainService
��( ?
.
��? @
GetAll
��@ F
(
��F G
)
��G H
.
��H I
Count
��I N
(
��N O
x
��O P
=>
��Q S
x
��T U
.
��U V
FollowUserId
��V b
==
��c e
followUserId
��f r
)
��r s
;
��s t
response
�� 
=
�� 
new
�� "
OperationResultVo
��# 4
<
��4 5
int
��5 8
>
��8 9
(
��9 :
newCount
��: B
)
��B C
;
��C D
}
�� 
}
�� 
return
�� 
response
�� 
;
�� 
}
�� 	
private
�� 
OperationResultVo
�� !!
RemoveProfileFollow
��" 5
(
��5 6
Guid
��6 :
id
��; =
)
��= >
{
�� 	
OperationResultVo
�� 
result
�� $
;
��$ %
try
�� 
{
�� 
this
�� 
.
�� %
userFollowDomainService
�� ,
.
��, -
Remove
��- 3
(
��3 4
id
��4 6
)
��6 7
;
��7 8

unitOfWork
�� 
.
�� 
Commit
�� !
(
��! "
)
��" #
;
��# $
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
(
��. /
true
��/ 3
)
��3 4
;
��4 5
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
(
��. /
ex
��/ 1
.
��1 2
Message
��2 9
)
��9 :
;
��: ;
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
kC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Services\GameAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #
Services# +
{ 
public 

class 
GameAppService 
:  !
BaseAppService" 0
,0 1
IGameAppService2 A
{ 
private 
readonly 
IMapper  
mapper! '
;' (
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
private 
readonly 
IGameRepository (

repository) 3
;3 4
private 
readonly 
IGameLikeRepository ,
gameLikeRepository- ?
;? @
private 
readonly &
IGamificationDomainService 3%
gamificationDomainService4 M
;M N
private 
readonly $
IGameFollowDomainService 1#
gameFollowDomainService2 I
;I J
public 
Guid 
CurrentUserId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
GameAppService 
( 
IMapper %
mapper& ,
,, -
IUnitOfWork. 9

unitOfWork: D
,D E
IGameRepositoryF U

repositoryV `
,` a
IGameLikeRepositoryb u
gameLikeRepository	v �
, &
IGamificationDomainService (%
gamificationDomainService) B
, $
IGameFollowDomainService &#
gameFollowDomainService' >
)> ?
{   	
this!! 
.!! 
mapper!! 
=!! 
mapper!!  
;!!  !
this"" 
."" 

unitOfWork"" 
="" 

unitOfWork"" (
;""( )
this## 
.## 

repository## 
=## 

repository## (
;##( )
this$$ 
.$$ 
gameLikeRepository$$ #
=$$$ %
gameLikeRepository$$& 8
;$$8 9
this%% 
.%% %
gamificationDomainService%% *
=%%+ ,%
gamificationDomainService%%- F
;%%F G
this&& 
.&& #
gameFollowDomainService&& (
=&&) *#
gameFollowDomainService&&+ B
;&&B C
}'' 	
public)) 
OperationResultVo))  
<))  !
int))! $
>))$ %
Count))& +
())+ ,
))), -
{** 	
OperationResultVo++ 
<++ 
int++ !
>++! "
result++# )
;++) *
try-- 
{.. 
int// 
count// 
=// 

repository// &
.//& '
GetAll//' -
(//- .
)//. /
./// 0
Count//0 5
(//5 6
)//6 7
;//7 8
result11 
=11 
new11 
OperationResultVo11 .
<11. /
int11/ 2
>112 3
(113 4
count114 9
)119 :
;11: ;
}22 
catch33 
(33 
	Exception33 
ex33 
)33  
{44 
result55 
=55 
new55 
OperationResultVo55 .
<55. /
int55/ 2
>552 3
(553 4
ex554 6
.556 7
Message557 >
)55> ?
;55? @
}66 
return88 
result88 
;88 
}99 	
public<< !
OperationResultListVo<< $
<<<$ %
GameViewModel<<% 2
><<2 3
GetAll<<4 :
(<<: ;
)<<; <
{== 	!
OperationResultListVo>> !
<>>! "
GameViewModel>>" /
>>>/ 0
result>>1 7
;>>7 8
try@@ 
{AA 

IQueryableBB 
<BB 
GameBB 
>BB  
	allModelsBB! *
=BB+ ,

repositoryBB- 7
.BB7 8
GetAllBB8 >
(BB> ?
)BB? @
;BB@ A
IEnumerableDD 
<DD 
GameViewModelDD )
>DD) *
vmsDD+ .
=DD/ 0
mapperDD1 7
.DD7 8
MapDD8 ;
<DD; <
IEnumerableDD< G
<DDG H
GameDDH L
>DDL M
,DDM N
IEnumerableDDO Z
<DDZ [
GameViewModelDD[ h
>DDh i
>DDi j
(DDj k
	allModelsDDk t
)DDt u
;DDu v
resultFF 
=FF 
newFF !
OperationResultListVoFF 2
<FF2 3
GameViewModelFF3 @
>FF@ A
(FFA B
vmsFFB E
)FFE F
;FFF G
}GG 
catchHH 
(HH 
	ExceptionHH 
exHH 
)HH  
{II 
resultJJ 
=JJ 
newJJ !
OperationResultListVoJJ 2
<JJ2 3
GameViewModelJJ3 @
>JJ@ A
(JJA B
exJJB D
.JJD E
MessageJJE L
)JJL M
;JJM N
}KK 
returnMM 
resultMM 
;MM 
}NN 	
publicPP 
OperationResultVoPP  
<PP  !
GameViewModelPP! .
>PP. /
GetByIdPP0 7
(PP7 8
GuidPP8 <
idPP= ?
)PP? @
{QQ 	
OperationResultVoRR 
<RR 
GameViewModelRR +
>RR+ ,
resultRR- 3
;RR3 4
tryTT 
{UU 
GameVV 
modelVV 
=VV 

repositoryVV '
.VV' (
GetByIdVV( /
(VV/ 0
idVV0 2
)VV2 3
;VV3 4
GameViewModelXX 
vmXX  
=XX! "
mapperXX# )
.XX) *
MapXX* -
<XX- .
GameViewModelXX. ;
>XX; <
(XX< =
modelXX= B
)XXB C
;XXC D
SetWebsiteUrlZZ 
(ZZ 
vmZZ  
)ZZ  !
;ZZ! "
vm\\ 
.\\ 
	LikeCount\\ 
=\\ 
gameLikeRepository\\ 1
.\\1 2
Count\\2 7
(\\7 8
x\\8 9
=>\\: <
x\\= >
.\\> ?
GameId\\? E
==\\F H
vm\\I K
.\\K L
Id\\L N
)\\N O
;\\O P
vm]] 
.]] 
FollowerCount]]  
=]]! "#
gameFollowDomainService]]# :
.]]: ;
Count]]; @
(]]@ A
x]]A B
=>]]C E
x]]F G
.]]G H
GameId]]H N
==]]O Q
vm]]R T
.]]T U
Id]]U W
)]]W X
;]]X Y
vm__ 
.__ 
CurrentUserLiked__ #
=__$ %
gameLikeRepository__& 8
.__8 9
GetAll__9 ?
(__? @
)__@ A
.__A B
Any__B E
(__E F
x__F G
=>__H J
x__K L
.__L M
GameId__M S
==__T V
vm__W Y
.__Y Z
Id__Z \
&&__] _
x__` a
.__a b
UserId__b h
==__i k
this__l p
.__p q
CurrentUserId__q ~
)__~ 
;	__ �
vm`` 
.``  
CurrentUserFollowing`` '
=``( )
this``* .
.``. /#
gameFollowDomainService``/ F
.``F G
GetAll``G M
(``M N
)``N O
.``O P
Any``P S
(``S T
x``T U
=>``V X
x``Y Z
.``Z [
GameId``[ a
==``b d
vm``e g
.``g h
Id``h j
&&``k m
x``n o
.``o p
UserId``p v
==``w y
this``z ~
.``~ 
CurrentUserId	`` �
)
``� �
;
``� �
resultbb 
=bb 
newbb 
OperationResultVobb .
<bb. /
GameViewModelbb/ <
>bb< =
(bb= >
vmbb> @
)bb@ A
;bbA B
}cc 
catchdd 
(dd 
	Exceptiondd 
exdd 
)dd  
{ee 
resultff 
=ff 
newff 
OperationResultVoff .
<ff. /
GameViewModelff/ <
>ff< =
(ff= >
exff> @
.ff@ A
MessageffA H
)ffH I
;ffI J
}gg 
returnii 
resultii 
;ii 
}jj 	
privatell 
staticll 
voidll 
SetWebsiteUrlll )
(ll) *
GameViewModelll* 7
vmll8 :
)ll: ;
{mm 	
ifnn 
(nn 
!nn 
stringnn 
.nn 
IsNullOrWhiteSpacenn *
(nn* +
vmnn+ -
.nn- .

WebsiteUrlnn. 8
)nn8 9
)nn9 :
{oo 
vmpp 
.pp 

WebsiteUrlpp 
=pp 
vmpp  "
.pp" #

WebsiteUrlpp# -
.pp- .
ToLowerpp. 5
(pp5 6
)pp6 7
;pp7 8
ifrr 
(rr 
!rr 
vmrr 
.rr 

WebsiteUrlrr "
.rr" #

StartsWithrr# -
(rr- .
$strrr. 5
)rr5 6
&&rr7 9
!rr: ;
vmrr; =
.rr= >

WebsiteUrlrr> H
.rrH I

StartsWithrrI S
(rrS T
$strrrT \
)rr\ ]
)rr] ^
{ss 
vmtt 
.tt 

WebsiteUrltt !
=tt" #
$strtt$ -
+tt. /
vmtt0 2
.tt2 3

WebsiteUrltt3 =
;tt= >
}uu 
}vv 
}ww 	
publicyy 
OperationResultVoyy  
Removeyy! '
(yy' (
Guidyy( ,
idyy- /
)yy/ 0
{zz 	
OperationResultVo{{ 
result{{ $
;{{$ %
try}} 
{~~ 

repository
�� 
.
�� 
Remove
�� !
(
��! "
id
��" $
)
��$ %
;
��% &

unitOfWork
�� 
.
�� 
Commit
�� !
(
��! "
)
��" #
;
��# $
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
(
��. /
true
��/ 3
)
��3 4
;
��4 5
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
(
��. /
ex
��/ 1
.
��1 2
Message
��2 9
)
��9 :
;
��: ;
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  
<
��  !
Guid
��! %
>
��% &
Save
��' +
(
��+ ,
GameViewModel
��, 9
	viewModel
��: C
)
��C D
{
�� 	
OperationResultVo
�� 
<
�� 
Guid
�� "
>
��" #
result
��$ *
;
��* +
try
�� 
{
�� 
Game
�� 
model
�� 
;
�� 
Game
�� 
existing
�� 
=
�� 

repository
��  *
.
��* +
GetById
��+ 2
(
��2 3
	viewModel
��3 <
.
��< =
Id
��= ?
)
��? @
;
��@ A
if
�� 
(
�� 
existing
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
model
�� 
=
�� 
mapper
�� "
.
��" #
Map
��# &
(
��& '
	viewModel
��' 0
,
��0 1
existing
��2 :
)
��: ;
;
��; <
}
�� 
else
�� 
{
�� 
model
�� 
=
�� 
mapper
�� "
.
��" #
Map
��# &
<
��& '
Game
��' +
>
��+ ,
(
��, -
	viewModel
��- 6
)
��6 7
;
��7 8
}
�� 
if
�� 
(
�� 
	viewModel
�� 
.
�� 
Id
��  
==
��! #
Guid
��$ (
.
��( )
Empty
��) .
)
��. /
{
�� 

repository
�� 
.
�� 
Add
�� "
(
��" #
model
��# (
)
��( )
;
��) *
	viewModel
�� 
.
�� 
Id
��  
=
��! "
model
��# (
.
��( )
Id
��) +
;
��+ ,
this
�� 
.
�� '
gamificationDomainService
�� 2
.
��2 3
ProcessAction
��3 @
(
��@ A
	viewModel
��A J
.
��J K
UserId
��K Q
,
��Q R
PlatformAction
��S a
.
��a b
GameAdd
��b i
)
��i j
;
��j k
}
�� 
else
�� 
{
�� 

repository
�� 
.
�� 
Update
�� %
(
��% &
model
��& +
)
��+ ,
;
��, -
}
�� 

unitOfWork
�� 
.
�� 
Commit
�� !
(
��! "
)
��" #
;
��# $
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
model
��5 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
ex
��5 7
.
��7 8
Message
��8 ?
)
��? @
;
��@ A
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
IEnumerable
�� 
<
�� #
GameListItemViewModel
�� 0
>
��0 1
	GetLatest
��2 ;
(
��; <
Guid
��< @
currentUserId
��A N
,
��N O
int
��P S
count
��T Y
,
��Y Z
Guid
��[ _
userId
��` f
,
��f g
	GameGenre
��h q
genre
��r w
)
��w x
{
�� 	

IQueryable
�� 
<
�� 
Game
�� 
>
�� 
	allModels
�� &
=
��' (

repository
��) 3
.
��3 4
GetAll
��4 :
(
��: ;
)
��; <
;
��< =
if
�� 
(
�� 
genre
�� 
!=
�� 
$num
�� 
)
�� 
{
�� 
	allModels
�� 
=
�� 
	allModels
�� %
.
��% &
Where
��& +
(
��+ ,
x
��, -
=>
��. 0
x
��1 2
.
��2 3
Genre
��3 8
==
��9 ;
genre
��< A
)
��A B
;
��B C
}
�� 
if
�� 
(
�� 
userId
�� 
!=
�� 
Guid
�� 
.
�� 
Empty
�� $
)
��$ %
{
�� 
	allModels
�� 
=
�� 
	allModels
�� %
.
��% &
Where
��& +
(
��+ ,
x
��, -
=>
��. 0
x
��1 2
.
��2 3
UserId
��3 9
==
��: <
userId
��= C
)
��C D
;
��D E
}
�� 
IOrderedQueryable
�� 
<
�� 
Game
�� "
>
��" #
ordered
��$ +
=
��, -
	allModels
��. 7
.
��7 8
OrderByDescending
��8 I
(
��I J
x
��J K
=>
��L N
x
��O P
.
��P Q

CreateDate
��Q [
)
��[ \
;
��\ ]

IQueryable
�� 
<
�� 
Game
�� 
>
�� 
taken
�� "
=
��# $
ordered
��% ,
.
��, -
Take
��- 1
(
��1 2
count
��2 7
)
��7 8
;
��8 9
List
�� 
<
�� #
GameListItemViewModel
�� &
>
��& '
vms
��( +
=
��, -
taken
��. 3
.
��3 4
	ProjectTo
��4 =
<
��= >#
GameListItemViewModel
��> S
>
��S T
(
��T U
mapper
��U [
.
��[ \#
ConfigurationProvider
��\ q
)
��q r
.
��r s
ToList
��s y
(
��y z
)
��z {
;
��{ |
foreach
�� 
(
�� #
GameListItemViewModel
�� *
item
��+ /
in
��0 2
vms
��3 6
)
��6 7
{
�� 
item
�� 
.
�� 
ThumbnailUrl
�� !
=
��" #
string
��$ *
.
��* + 
IsNullOrWhiteSpace
��+ =
(
��= >
item
��> B
.
��B C
ThumbnailUrl
��C O
)
��O P
||
��Q S
	Constants
��T ]
.
��] ^"
DefaultGameThumbnail
��^ r
.
��r s
Contains
��s {
(
��{ |
item��| �
.��� �
ThumbnailUrl��� �
)��� �
?��� �
	Constants��� �
.��� �$
DefaultGameThumbnail��� �
:��� �
UrlFormatter��� �
.��� �
Image��� �
(��� �
item��� �
.��� �
UserId��� �
,��� �
BlobType��� �
.��� �
GameThumbnail��� �
,��� �
item��� �
.��� �
ThumbnailUrl��� �
)��� �
;��� �
item
�� 
.
�� 
DeveloperImageUrl
�� &
=
��' (
UrlFormatter
��) 5
.
��5 6
ProfileImage
��6 B
(
��B C
item
��C G
.
��G H
UserId
��H N
)
��N O
;
��O P
}
�� 
return
�� 
vms
�� 
;
�� 
}
�� 	
public
�� 
IEnumerable
�� 
<
�� 
SelectListItemVo
�� +
>
��+ ,
	GetByUser
��- 6
(
��6 7
Guid
��7 ;
userId
��< B
)
��B C
{
�� 	

IQueryable
�� 
<
�� 
Game
�� 
>
�� 
	allModels
�� &
=
��' (

repository
��) 3
.
��3 4
GetAll
��4 :
(
��: ;
)
��; <
.
��< =
Where
��= B
(
��B C
x
��C D
=>
��E G
x
��H I
.
��I J
UserId
��J P
==
��Q S
userId
��T Z
)
��Z [
;
��[ \
List
�� 
<
�� 
SelectListItemVo
�� !
>
��! "
vms
��# &
=
��' (
	allModels
��) 2
.
��2 3
	ProjectTo
��3 <
<
��< =
SelectListItemVo
��= M
>
��M N
(
��N O
mapper
��O U
.
��U V#
ConfigurationProvider
��V k
)
��k l
.
��l m
ToList
��m s
(
��s t
)
��t u
;
��u v
return
�� 
vms
�� 
;
�� 
}
�� 	
}
�� 
}�� �[
qC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Services\GameFollowAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #
Services# +
{ 
public 

class  
GameFollowAppService %
:& '
BaseAppService( 6
,6 7!
IGameFollowAppService8 M
{ 
private 
readonly 
IMapper  
mapper! '
;' (
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
private 
readonly $
IGameFollowDomainService 1#
gameFollowDomainService2 I
;I J
public  
GameFollowAppService #
(# $
IMapper$ +
mapper, 2
,2 3
IUnitOfWork4 ?

unitOfWork@ J
, $
IGameFollowDomainService &#
gameFollowDomainService' >
)> ?
{ 	
this 
. 
mapper 
= 
mapper  
;  !
this 
. 

unitOfWork 
= 

unitOfWork (
;( )
this 
. #
gameFollowDomainService (
=) *#
gameFollowDomainService+ B
;B C
} 	
public 
OperationResultVo  
<  !
int! $
>$ %
Count& +
(+ ,
), -
{ 	
OperationResultVo 
< 
int !
>! "
result# )
;) *
try 
{   
int!! 
count!! 
=!! #
gameFollowDomainService!! 3
.!!3 4
Count!!4 9
(!!9 :
)!!: ;
;!!; <
result## 
=## 
new## 
OperationResultVo## .
<##. /
int##/ 2
>##2 3
(##3 4
count##4 9
)##9 :
;##: ;
}$$ 
catch%% 
(%% 
	Exception%% 
ex%% 
)%%  
{&& 
result'' 
='' 
new'' 
OperationResultVo'' .
<''. /
int''/ 2
>''2 3
(''3 4
ex''4 6
.''6 7
Message''7 >
)''> ?
;''? @
}(( 
return** 
result** 
;** 
}++ 	
public-- !
OperationResultListVo-- $
<--$ %
GameFollowViewModel--% 8
>--8 9
GetAll--: @
(--@ A
)--A B
{.. 	!
OperationResultListVo// !
<//! "
GameFollowViewModel//" 5
>//5 6
result//7 =
;//= >
try11 
{22 
IEnumerable33 
<33 

GameFollow33 &
>33& '
	allModels33( 1
=332 3
this334 8
.338 9#
gameFollowDomainService339 P
.33P Q
GetAll33Q W
(33W X
)33X Y
;33Y Z
IEnumerable55 
<55 
GameFollowViewModel55 /
>55/ 0
vms551 4
=555 6
mapper557 =
.55= >
Map55> A
<55A B
IEnumerable55B M
<55M N

GameFollow55N X
>55X Y
,55Y Z
IEnumerable55[ f
<55f g
GameFollowViewModel55g z
>55z {
>55{ |
(55| }
	allModels	55} �
)
55� �
;
55� �
result77 
=77 
new77 !
OperationResultListVo77 2
<772 3
GameFollowViewModel773 F
>77F G
(77G H
vms77H K
)77K L
;77L M
}88 
catch99 
(99 
	Exception99 
ex99 
)99  
{:: 
result;; 
=;; 
new;; !
OperationResultListVo;; 2
<;;2 3
GameFollowViewModel;;3 F
>;;F G
(;;G H
ex;;H J
.;;J K
Message;;K R
);;R S
;;;S T
}<< 
return>> 
result>> 
;>> 
}?? 	
publicAA !
OperationResultListVoAA $
<AA$ %
GameFollowViewModelAA% 8
>AA8 9
GetByGameIdAA: E
(AAE F
GuidAAF J
gameIdAAK Q
)AAQ R
{BB 	!
OperationResultListVoCC !
<CC! "
GameFollowViewModelCC" 5
>CC5 6
resultCC7 =
;CC= >
tryEE 
{FF 
IEnumerableGG 
<GG 

GameFollowGG &
>GG& '
	allModelsGG( 1
=GG2 3
thisGG4 8
.GG8 9#
gameFollowDomainServiceGG9 P
.GGP Q
GetByGameIdGGQ \
(GG\ ]
gameIdGG] c
)GGc d
;GGd e
IEnumerableII 
<II 
GameFollowViewModelII /
>II/ 0
vmsII1 4
=II5 6
mapperII7 =
.II= >
MapII> A
<IIA B
IEnumerableIIB M
<IIM N

GameFollowIIN X
>IIX Y
,IIY Z
IEnumerableII[ f
<IIf g
GameFollowViewModelIIg z
>IIz {
>II{ |
(II| }
	allModels	II} �
)
II� �
;
II� �
resultKK 
=KK 
newKK !
OperationResultListVoKK 2
<KK2 3
GameFollowViewModelKK3 F
>KKF G
(KKG H
vmsKKH K
)KKK L
;KKL M
}LL 
catchMM 
(MM 
	ExceptionMM 
exMM 
)MM  
{NN 
resultOO 
=OO 
newOO !
OperationResultListVoOO 2
<OO2 3
GameFollowViewModelOO3 F
>OOF G
(OOG H
exOOH J
.OOJ K
MessageOOK R
)OOR S
;OOS T
}PP 
returnRR 
resultRR 
;RR 
}SS 	
publicUU 
OperationResultVoUU  
<UU  !
GameFollowViewModelUU! 4
>UU4 5
GetByIdUU6 =
(UU= >
GuidUU> B
idUUC E
)UUE F
{VV 	
OperationResultVoWW 
<WW 
GameFollowViewModelWW 1
>WW1 2
resultWW3 9
;WW9 :
tryYY 
{ZZ 

GameFollow[[ 
model[[  
=[[! "
this[[# '
.[[' (#
gameFollowDomainService[[( ?
.[[? @
GetById[[@ G
([[G H
id[[H J
)[[J K
;[[K L
GameFollowViewModel]] #
vm]]$ &
=]]' (
mapper]]) /
.]]/ 0
Map]]0 3
<]]3 4
GameFollowViewModel]]4 G
>]]G H
(]]H I
model]]I N
)]]N O
;]]O P
result__ 
=__ 
new__ 
OperationResultVo__ .
<__. /
GameFollowViewModel__/ B
>__B C
(__C D
vm__D F
)__F G
;__G H
}`` 
catchaa 
(aa 
	Exceptionaa 
exaa 
)aa  
{bb 
resultcc 
=cc 
newcc 
OperationResultVocc .
<cc. /
GameFollowViewModelcc/ B
>ccB C
(ccC D
exccD F
.ccF G
MessageccG N
)ccN O
;ccO P
}dd 
returnff 
resultff 
;ff 
}gg 	
publicii 
OperationResultVoii  
Removeii! '
(ii' (
Guidii( ,
idii- /
)ii/ 0
{jj 	
OperationResultVokk 
resultkk $
;kk$ %
trymm 
{nn 
thisqq 
.qq #
gameFollowDomainServiceqq ,
.qq, -
Removeqq- 3
(qq3 4
idqq4 6
)qq6 7
;qq7 8

unitOfWorkss 
.ss 
Commitss !
(ss! "
)ss" #
;ss# $
resultuu 
=uu 
newuu 
OperationResultVouu .
(uu. /
trueuu/ 3
)uu3 4
;uu4 5
}vv 
catchww 
(ww 
	Exceptionww 
exww 
)ww  
{xx 
resultyy 
=yy 
newyy 
OperationResultVoyy .
(yy. /
exyy/ 1
.yy1 2
Messageyy2 9
)yy9 :
;yy: ;
}zz 
return|| 
result|| 
;|| 
}}} 	
public 
OperationResultVo  
<  !
Guid! %
>% &
Save' +
(+ ,
GameFollowViewModel, ?
	viewModel@ I
)I J
{
�� 	
OperationResultVo
�� 
<
�� 
Guid
�� "
>
��" #
result
��$ *
;
��* +
try
�� 
{
�� 

GameFollow
�� 
model
��  
;
��  !

GameFollow
�� 
existing
�� #
=
��$ %
this
��& *
.
��* +%
gameFollowDomainService
��+ B
.
��B C
GetById
��C J
(
��J K
	viewModel
��K T
.
��T U
Id
��U W
)
��W X
;
��X Y
if
�� 
(
�� 
existing
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
model
�� 
=
�� 
mapper
�� "
.
��" #
Map
��# &
(
��& '
	viewModel
��' 0
,
��0 1
existing
��2 :
)
��: ;
;
��; <
}
�� 
else
�� 
{
�� 
model
�� 
=
�� 
mapper
�� "
.
��" #
Map
��# &
<
��& '

GameFollow
��' 1
>
��1 2
(
��2 3
	viewModel
��3 <
)
��< =
;
��= >
}
�� 
if
�� 
(
�� 
	viewModel
�� 
.
�� 
Id
��  
==
��! #
Guid
��$ (
.
��( )
Empty
��) .
)
��. /
{
�� 
this
�� 
.
�� %
gameFollowDomainService
�� 0
.
��0 1
Add
��1 4
(
��4 5
model
��5 :
)
��: ;
;
��; <
	viewModel
�� 
.
�� 
Id
��  
=
��! "
model
��# (
.
��( )
Id
��) +
;
��+ ,
}
�� 
else
�� 
{
�� 
this
�� 
.
�� %
gameFollowDomainService
�� 0
.
��0 1
Update
��1 7
(
��7 8
model
��8 =
)
��= >
;
��> ?
}
�� 

unitOfWork
�� 
.
�� 
Commit
�� !
(
��! "
)
��" #
;
��# $
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
model
��5 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
ex
��5 7
.
��7 8
Message
��8 ?
)
��? @
;
��@ A
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
}
�� 
}�� �,
pC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Services\ImageStorageService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #
Services# +
{		 
public

 

class

 
ImageStorageService

 $
:

% & 
IImageStorageService

' ;
{ 
private 
readonly 
IConfiguration '
_config( /
;/ 0
private 
CloudStorageAccount #
storageAccount$ 2
;2 3
private 
CloudBlobContainer "
cloudBlobContainer# 5
;5 6
public 
ImageStorageService "
(" #
IConfiguration# 1
config2 8
)8 9
{ 	
_config 
= 
config 
; 
} 	
public 
async 
Task 
< 
string  
>  !
StoreImageAsync" 1
(1 2
string2 8
	container9 B
,B C
stringD J
filenameK S
,S T
byteU Y
[Y Z
]Z [
image\ a
)a b
{ 	
string 
filenameonly 
=  !
Path" &
.& '
GetFileName' 2
(2 3
filename3 ;
); <
;< =
string #
storageConnectionString *
=+ ,
_config- 4
[4 5
$str5 O
]O P
;P Q
if 
( 
CloudStorageAccount #
.# $
TryParse$ ,
(, -#
storageConnectionString- D
,D E
outF I
storageAccountJ X
)X Y
)Y Z
{ 
CloudBlobClient 
cloudBlobClient  /
=0 1
storageAccount2 @
.@ A!
CreateCloudBlobClientA V
(V W
)W X
;X Y
cloudBlobContainer!! "
=!!# $
cloudBlobClient!!% 4
.!!4 5!
GetContainerReference!!5 J
(!!J K
	container!!K T
)!!T U
;!!U V
bool"" 
created"" 
="" 
await"" $
cloudBlobContainer""% 7
.""7 8"
CreateIfNotExistsAsync""8 N
(""N O
)""O P
;""P Q
if## 
(## 
created## 
)## 
{$$ $
BlobContainerPermissions&& ,
permissions&&- 8
=&&9 :
new&&; >$
BlobContainerPermissions&&? W
{'' 
PublicAccess(( $
=((% &)
BlobContainerPublicAccessType((' D
.((D E
Blob((E I
})) 
;)) 
await++ 
cloudBlobContainer++ ,
.++, -
SetPermissionsAsync++- @
(++@ A
permissions++A L
)++L M
;++M N
},, 
CloudBlockBlob// 
cloudBlockBlob// -
=//. /
cloudBlobContainer//0 B
.//B C!
GetBlockBlobReference//C X
(//X Y
filename//Y a
)//a b
;//b c
if00 
(00 
image00 
!=00 
null00 !
)00! "
{11 
await22 
cloudBlockBlob22 (
.22( )$
UploadFromByteArrayAsync22) A
(22A B
image22B G
,22G H
$num22I J
,22J K
image22L Q
.22Q R
Length22R X
)22X Y
;22Y Z
}33 
}44 
return66 
filename66 
;66 
}77 	
public:: 
async:: 
Task:: 
<:: 
string::  
>::  !
DeleteImageAsync::" 2
(::2 3
string::3 9
	container::: C
,::C D
string::E K
filename::L T
)::T U
{;; 	
if== 
(== 
!== 
string== 
.== 
IsNullOrWhiteSpace== *
(==* +
filename==+ 3
)==3 4
)==4 5
{>> 
string?? 
filenameonly?? #
=??$ %
Path??& *
.??* +
GetFileName??+ 6
(??6 7
filename??7 ?
)??? @
;??@ A
stringAA #
storageConnectionStringAA .
=AA/ 0
_configAA1 8
[AA8 9
$strAA9 S
]AAS T
;AAT U
ifCC 
(CC 
CloudStorageAccountCC '
.CC' (
TryParseCC( 0
(CC0 1#
storageConnectionStringCC1 H
,CCH I
outCCJ M
storageAccountCCN \
)CC\ ]
)CC] ^
{DD 
CloudBlobClientFF #
cloudBlobClientFF$ 3
=FF4 5
storageAccountFF6 D
.FFD E!
CreateCloudBlobClientFFE Z
(FFZ [
)FF[ \
;FF\ ]
cloudBlobContainerHH &
=HH' (
cloudBlobClientHH) 8
.HH8 9!
GetContainerReferenceHH9 N
(HHN O
	containerHHO X
)HHX Y
;HHY Z
CloudBlockBlobKK "
cloudBlockBlobKK# 1
=KK2 3
cloudBlobContainerKK4 F
.KKF G!
GetBlockBlobReferenceKKG \
(KK\ ]
filenameKK] e
)KKe f
;KKf g
awaitMM 
cloudBlockBlobMM (
.MM( )
DeleteIfExistsAsyncMM) <
(MM< =
)MM= >
;MM> ?
}NN 
}OO 
returnQQ 
filenameQQ 
;QQ 
}RR 	
}SS 
}TT ��
kC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Services\LikeAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #
Services# +
{ 
public 

class 
LikeAppService 
:  !
BaseAppService" 0
,0 1
ILikeAppService2 A
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly &
IUserContentLikeRepository 3"
_contentLikeRepository4 J
;J K
private 
readonly 
IGameLikeRepository ,
_gameLikeRepository- @
;@ A
public 
Guid 
CurrentUserId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
LikeAppService 
( 
IMapper %
mapper& ,
,, -
IUnitOfWork. 9

unitOfWork: D
, &
IUserContentLikeRepository (!
contentLikeRepository) >
,> ?
IGameLikeRepository@ S
gameLikeRepositoryT f
)f g
{ 	
_mapper 
= 
mapper 
; 
_unitOfWork 
= 

unitOfWork $
;$ %"
_contentLikeRepository "
=# $!
contentLikeRepository% :
;: ;
_gameLikeRepository 
=  !
gameLikeRepository" 4
;4 5
} 	
public   
OperationResultVo    
<    !
int  ! $
>  $ %
Count  & +
(  + ,
)  , -
{!! 	
OperationResultVo"" 
<"" 
int"" !
>""! "
result""# )
;"") *
try$$ 
{%% 
int&& 
count&& 
=&& "
_contentLikeRepository&& 2
.&&2 3
GetAll&&3 9
(&&9 :
)&&: ;
.&&; <
Count&&< A
(&&A B
)&&B C
;&&C D
result(( 
=(( 
new(( 
OperationResultVo(( .
<((. /
int((/ 2
>((2 3
(((3 4
count((4 9
)((9 :
;((: ;
})) 
catch** 
(** 
	Exception** 
ex** 
)**  
{++ 
result,, 
=,, 
new,, 
OperationResultVo,, .
<,,. /
int,,/ 2
>,,2 3
(,,3 4
ex,,4 6
.,,6 7
Message,,7 >
),,> ?
;,,? @
}-- 
return// 
result// 
;// 
}00 	
public22 !
OperationResultListVo22 $
<22$ %
UserLikeViewModel22% 6
>226 7
GetAll228 >
(22> ?
)22? @
{33 	!
OperationResultListVo44 !
<44! "
UserLikeViewModel44" 3
>443 4
result445 ;
;44; <
try66 
{77 

IQueryable88 
<88 
UserContentLike88 *
>88* +
	allModels88, 5
=886 7"
_contentLikeRepository888 N
.88N O
GetAll88O U
(88U V
)88V W
;88W X
IEnumerable:: 
<:: 
UserLikeViewModel:: -
>::- .
vms::/ 2
=::3 4
_mapper::5 <
.::< =
Map::= @
<::@ A
IEnumerable::A L
<::L M
UserContentLike::M \
>::\ ]
,::] ^
IEnumerable::_ j
<::j k
UserLikeViewModel::k |
>::| }
>::} ~
(::~ 
	allModels	:: �
)
::� �
;
::� �
result<< 
=<< 
new<< !
OperationResultListVo<< 2
<<<2 3
UserLikeViewModel<<3 D
><<D E
(<<E F
vms<<F I
)<<I J
;<<J K
}== 
catch>> 
(>> 
	Exception>> 
ex>> 
)>>  
{?? 
result@@ 
=@@ 
new@@ !
OperationResultListVo@@ 2
<@@2 3
UserLikeViewModel@@3 D
>@@D E
(@@E F
ex@@F H
.@@H I
Message@@I P
)@@P Q
;@@Q R
}AA 
returnCC 
resultCC 
;CC 
}DD 	
publicFF 
OperationResultVoFF  
<FF  !
UserLikeViewModelFF! 2
>FF2 3
GetByIdFF4 ;
(FF; <
GuidFF< @
idFFA C
)FFC D
{GG 	
OperationResultVoHH 
<HH 
UserLikeViewModelHH /
>HH/ 0
resultHH1 7
;HH7 8
tryJJ 
{KK 
UserContentLikeLL 
modelLL  %
=LL& '"
_contentLikeRepositoryLL( >
.LL> ?
GetByIdLL? F
(LLF G
idLLG I
)LLI J
;LLJ K
UserLikeViewModelNN !
vmNN" $
=NN% &
_mapperNN' .
.NN. /
MapNN/ 2
<NN2 3
UserLikeViewModelNN3 D
>NND E
(NNE F
modelNNF K
)NNK L
;NNL M
resultPP 
=PP 
newPP 
OperationResultVoPP .
<PP. /
UserLikeViewModelPP/ @
>PP@ A
(PPA B
vmPPB D
)PPD E
;PPE F
}QQ 
catchRR 
(RR 
	ExceptionRR 
exRR 
)RR  
{SS 
resultTT 
=TT 
newTT 
OperationResultVoTT .
<TT. /
UserLikeViewModelTT/ @
>TT@ A
(TTA B
exTTB D
.TTD E
MessageTTE L
)TTL M
;TTM N
}UU 
returnWW 
resultWW 
;WW 
}XX 	
publicZZ 
OperationResultVoZZ  
RemoveZZ! '
(ZZ' (
GuidZZ( ,
idZZ- /
)ZZ/ 0
{[[ 	
OperationResultVo\\ 
result\\ $
;\\$ %
try^^ 
{__ "
_contentLikeRepositorybb &
.bb& '
Removebb' -
(bb- .
idbb. 0
)bb0 1
;bb1 2
_unitOfWorkdd 
.dd 
Commitdd "
(dd" #
)dd# $
;dd$ %
resultff 
=ff 
newff 
OperationResultVoff .
(ff. /
trueff/ 3
)ff3 4
;ff4 5
}gg 
catchhh 
(hh 
	Exceptionhh 
exhh 
)hh  
{ii 
resultjj 
=jj 
newjj 
OperationResultVojj .
(jj. /
exjj/ 1
.jj1 2
Messagejj2 9
)jj9 :
;jj: ;
}kk 
returnmm 
resultmm 
;mm 
}nn 	
publicpp 
OperationResultVopp  
<pp  !
Guidpp! %
>pp% &
Savepp' +
(pp+ ,
UserLikeViewModelpp, =
	viewModelpp> G
)ppG H
{qq 	
OperationResultVorr 
<rr 
Guidrr "
>rr" #
resultrr$ *
;rr* +
trytt 
{uu 
UserContentLikevv 
modelvv  %
;vv% &
UserContentLikezz 
existingzz  (
=zz) *"
_contentLikeRepositoryzz+ A
.zzA B
GetByIdzzB I
(zzI J
	viewModelzzJ S
.zzS T
IdzzT V
)zzV W
;zzW X
if{{ 
({{ 
existing{{ 
!={{ 
null{{  $
){{$ %
{|| 
model}} 
=}} 
_mapper}} #
.}}# $
Map}}$ '
(}}' (
	viewModel}}( 1
,}}1 2
existing}}3 ;
)}}; <
;}}< =
}~~ 
else 
{
�� 
model
�� 
=
�� 
_mapper
�� #
.
��# $
Map
��$ '
<
��' (
UserContentLike
��( 7
>
��7 8
(
��8 9
	viewModel
��9 B
)
��B C
;
��C D
}
�� 
if
�� 
(
�� 
	viewModel
�� 
.
�� 
Id
��  
==
��! #
Guid
��$ (
.
��( )
Empty
��) .
)
��. /
{
�� $
_contentLikeRepository
�� *
.
��* +
Add
��+ .
(
��. /
model
��/ 4
)
��4 5
;
��5 6
	viewModel
�� 
.
�� 
Id
��  
=
��! "
model
��# (
.
��( )
Id
��) +
;
��+ ,
}
�� 
else
�� 
{
�� $
_contentLikeRepository
�� *
.
��* +
Update
��+ 1
(
��1 2
model
��2 7
)
��7 8
;
��8 9
}
�� 
_unitOfWork
�� 
.
�� 
Commit
�� "
(
��" #
)
��# $
;
��$ %
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
model
��5 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
ex
��5 7
.
��7 8
Message
��8 ?
)
��? @
;
��@ A
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  
ContentLike
��! ,
(
��, -
Guid
��- 1
likedId
��2 9
)
��9 :
{
�� 	
OperationResultVo
�� 
response
�� &
;
��& '
bool
�� 
alreadyLiked
�� 
=
�� $
_contentLikeRepository
��  6
.
��6 7
GetAll
��7 =
(
��= >
)
��> ?
.
��? @
Any
��@ C
(
��C D
x
��D E
=>
��F H
x
��I J
.
��J K
	ContentId
��K T
==
��U W
likedId
��X _
&&
��` b
x
��c d
.
��d e
UserId
��e k
==
��l n
this
��o s
.
��s t
CurrentUserId��t �
)��� �
;��� �
if
�� 
(
�� 
alreadyLiked
�� 
)
�� 
{
�� 
response
�� 
=
�� 
new
�� 
OperationResultVo
�� 0
(
��0 1
false
��1 6
)
��6 7
;
��7 8
response
�� 
.
�� 
Message
��  
=
��! "
$str
��# :
;
��: ;
}
�� 
else
�� 
{
�� 
UserContentLike
�� 
model
��  %
=
��& '
new
��( +
UserContentLike
��, ;
(
��; <
)
��< =
;
��= >
model
�� 
.
�� 
	ContentId
�� 
=
��  !
likedId
��" )
;
��) *
model
�� 
.
�� 
UserId
�� 
=
�� 
this
�� #
.
��# $
CurrentUserId
��$ 1
;
��1 2$
_contentLikeRepository
�� &
.
��& '
Add
��' *
(
��* +
model
��+ 0
)
��0 1
;
��1 2
_unitOfWork
�� 
.
�� 
Commit
�� "
(
��" #
)
��# $
;
��$ %
int
�� 
newCount
�� 
=
�� $
_contentLikeRepository
�� 5
.
��5 6
GetAll
��6 <
(
��< =
)
��= >
.
��> ?
Count
��? D
(
��D E
x
��E F
=>
��G I
x
��J K
.
��K L
	ContentId
��L U
==
��V X
likedId
��Y `
&&
��a c
x
��d e
.
��e f
UserId
��f l
==
��m o
this
��p t
.
��t u
CurrentUserId��u �
)��� �
;��� �
response
�� 
=
�� 
new
�� 
OperationResultVo
�� 0
<
��0 1
int
��1 4
>
��4 5
(
��5 6
newCount
��6 >
)
��> ?
;
��? @
}
�� 
return
�� 
response
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  
ContentUnlike
��! .
(
��. /
Guid
��/ 3
likedId
��4 ;
)
��; <
{
�� 	
OperationResultVo
�� 
response
�� &
;
��& '
UserContentLike
�� 
existingLike
�� (
=
��) *$
_contentLikeRepository
��+ A
.
��A B
GetAll
��B H
(
��H I
)
��I J
.
��J K
FirstOrDefault
��K Y
(
��Y Z
x
��Z [
=>
��\ ^
x
��_ `
.
��` a
	ContentId
��a j
==
��k m
likedId
��n u
&&
��v x
x
��y z
.
��z {
UserId��{ �
==��� �
this��� �
.��� �
CurrentUserId��� �
)��� �
;��� �
if
�� 
(
�� 
existingLike
�� 
==
�� 
null
��  $
)
��$ %
{
�� 
response
�� 
=
�� 
new
�� 
OperationResultVo
�� 0
(
��0 1
false
��1 6
)
��6 7
;
��7 8
response
�� 
.
�� 
Message
��  
=
��! "
$str
��# 6
;
��6 7
}
�� 
else
�� 
{
�� 
this
�� 
.
�� 
Remove
�� 
(
�� 
existingLike
�� (
.
��( )
Id
��) +
)
��+ ,
;
��, -
_unitOfWork
�� 
.
�� 
Commit
�� "
(
��" #
)
��# $
;
��$ %
int
�� 
newCount
�� 
=
�� $
_contentLikeRepository
�� 5
.
��5 6
GetAll
��6 <
(
��< =
)
��= >
.
��> ?
Count
��? D
(
��D E
x
��E F
=>
��G I
x
��J K
.
��K L
	ContentId
��L U
==
��V X
likedId
��Y `
&&
��a c
x
��d e
.
��e f
UserId
��f l
==
��m o
this
��p t
.
��t u
CurrentUserId��u �
)��� �
;��� �
response
�� 
=
�� 
new
�� 
OperationResultVo
�� 0
<
��0 1
int
��1 4
>
��4 5
(
��5 6
newCount
��6 >
)
��> ?
;
��? @
}
�� 
return
�� 
response
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  
GameLike
��! )
(
��) *
Guid
��* .
likedId
��/ 6
)
��6 7
{
�� 	
OperationResultVo
�� 
response
�� &
;
��& '
if
�� 
(
�� 
this
�� 
.
�� 
CurrentUserId
�� "
==
��# %
Guid
��& *
.
��* +
Empty
��+ 0
)
��0 1
{
�� 
response
�� 
=
�� 
new
�� 
OperationResultVo
�� 0
(
��0 1
$str
��1 W
)
��W X
;
��X Y
}
�� 
else
�� 
{
�� 
bool
�� 
alreadyLiked
�� !
=
��" #!
_gameLikeRepository
��$ 7
.
��7 8
GetAll
��8 >
(
��> ?
)
��? @
.
��@ A
Any
��A D
(
��D E
x
��E F
=>
��G I
x
��J K
.
��K L
GameId
��L R
==
��S U
likedId
��V ]
&&
��^ `
x
��a b
.
��b c
UserId
��c i
==
��j l
this
��m q
.
��q r
CurrentUserId
��r 
)�� �
;��� �
if
�� 
(
�� 
alreadyLiked
��  
)
��  !
{
�� 
response
�� 
=
�� 
new
�� "
OperationResultVo
��# 4
(
��4 5
false
��5 :
)
��: ;
;
��; <
response
�� 
.
�� 
Message
�� $
=
��% &
$str
��' ;
;
��; <
}
�� 
else
�� 
{
�� 
GameLike
�� 
model
�� "
=
��# $
new
��% (
GameLike
��) 1
(
��1 2
)
��2 3
;
��3 4
model
�� 
.
�� 
GameId
��  
=
��! "
likedId
��# *
;
��* +
model
�� 
.
�� 
UserId
��  
=
��! "
this
��# '
.
��' (
CurrentUserId
��( 5
;
��5 6!
_gameLikeRepository
�� '
.
��' (
Add
��( +
(
��+ ,
model
��, 1
)
��1 2
;
��2 3
_unitOfWork
�� 
.
��  
Commit
��  &
(
��& '
)
��' (
;
��( )
int
�� 
newCount
��  
=
��! "!
_gameLikeRepository
��# 6
.
��6 7
GetAll
��7 =
(
��= >
)
��> ?
.
��? @
Count
��@ E
(
��E F
x
��F G
=>
��H J
x
��K L
.
��L M
GameId
��M S
==
��T V
likedId
��W ^
&&
��_ a
x
��b c
.
��c d
UserId
��d j
==
��k m
this
��n r
.
��r s
CurrentUserId��s �
)��� �
;��� �
response
�� 
=
�� 
new
�� "
OperationResultVo
��# 4
<
��4 5
int
��5 8
>
��8 9
(
��9 :
newCount
��: B
)
��B C
;
��C D
}
�� 
}
�� 
return
�� 
response
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  

GameUnlike
��! +
(
��+ ,
Guid
��, 0
likedId
��1 8
)
��8 9
{
�� 	
OperationResultVo
�� 
response
�� &
;
��& '
if
�� 
(
�� 
this
�� 
.
�� 
CurrentUserId
�� "
==
��# %
Guid
��& *
.
��* +
Empty
��+ 0
)
��0 1
{
�� 
response
�� 
=
�� 
new
�� 
OperationResultVo
�� 0
(
��0 1
$str
��1 Y
)
��Y Z
;
��Z [
}
�� 
else
�� 
{
�� 
GameLike
�� 
existingLike
�� %
=
��& '!
_gameLikeRepository
��( ;
.
��; <
GetAll
��< B
(
��B C
)
��C D
.
��D E
FirstOrDefault
��E S
(
��S T
x
��T U
=>
��V X
x
��Y Z
.
��Z [
GameId
��[ a
==
��b d
likedId
��e l
&&
��m o
x
��p q
.
��q r
UserId
��r x
==
��y {
this��| �
.��� �
CurrentUserId��� �
)��� �
;��� �
if
�� 
(
�� 
existingLike
��  
==
��! #
null
��$ (
)
��( )
{
�� 
response
�� 
=
�� 
new
�� "
OperationResultVo
��# 4
(
��4 5
false
��5 :
)
��: ;
;
��; <
response
�� 
.
�� 
Message
�� $
=
��% &
$str
��' 7
;
��7 8
}
�� 
else
�� 
{
�� 
this
�� 
.
�� 
RemoveGameLike
�� '
(
��' (
existingLike
��( 4
.
��4 5
Id
��5 7
)
��7 8
;
��8 9
_unitOfWork
�� 
.
��  
Commit
��  &
(
��& '
)
��' (
;
��( )
int
�� 
newCount
��  
=
��! "!
_gameLikeRepository
��# 6
.
��6 7
GetAll
��7 =
(
��= >
)
��> ?
.
��? @
Count
��@ E
(
��E F
x
��F G
=>
��H J
x
��K L
.
��L M
GameId
��M S
==
��T V
likedId
��W ^
&&
��_ a
x
��b c
.
��c d
UserId
��d j
==
��k m
this
��n r
.
��r s
CurrentUserId��s �
)��� �
;��� �
response
�� 
=
�� 
new
�� "
OperationResultVo
��# 4
<
��4 5
int
��5 8
>
��8 9
(
��9 :
newCount
��: B
)
��B C
;
��C D
}
�� 
}
�� 
return
�� 
response
�� 
;
�� 
}
�� 	
private
�� 
OperationResultVo
�� !
RemoveGameLike
��" 0
(
��0 1
Guid
��1 5
id
��6 8
)
��8 9
{
�� 	
OperationResultVo
�� 
result
�� $
;
��$ %
try
�� 
{
�� !
_gameLikeRepository
�� #
.
��# $
Remove
��$ *
(
��* +
id
��+ -
)
��- .
;
��. /
_unitOfWork
�� 
.
�� 
Commit
�� "
(
��" #
)
��# $
;
��$ %
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
(
��. /
true
��/ 3
)
��3 4
;
��4 5
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
(
��. /
ex
��/ 1
.
��1 2
Message
��2 9
)
��9 :
;
��: ;
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
}
�� 
}�� �i
sC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Services\NotificationAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #
Services# +
{ 
public 

class "
NotificationAppService '
:( )
BaseAppService* 8
,8 9#
INotificationAppService: Q
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly #
INotificationRepository 0#
_notificationRepository1 H
;H I
public 
Guid 
CurrentUserId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public "
NotificationAppService %
(% &
IMapper& -
mapper. 4
,4 5
IUnitOfWork6 A

unitOfWorkB L
,L M#
INotificationRepositoryN e"
notificationRepositoryf |
)| }
{ 	
_mapper 
= 
mapper 
; 
_unitOfWork 
= 

unitOfWork $
;$ %#
_notificationRepository #
=$ %"
notificationRepository& <
;< =
} 	
public 
OperationResultVo  
<  !
int! $
>$ %
Count& +
(+ ,
), -
{   	
OperationResultVo!! 
<!! 
int!! !
>!!! "
result!!# )
=!!* +
new!!, /
OperationResultVo!!0 A
<!!A B
int!!B E
>!!E F
(!!F G
string!!G M
.!!M N
Empty!!N S
)!!S T
;!!T U
return## 
result## 
;## 
}$$ 	
public&& !
OperationResultListVo&& $
<&&$ %%
NotificationItemViewModel&&% >
>&&> ?
GetAll&&@ F
(&&F G
)&&G H
{'' 	!
OperationResultListVo(( !
<((! "%
NotificationItemViewModel((" ;
>((; <
result((= C
=((D E
new((F I!
OperationResultListVo((J _
<((_ `%
NotificationItemViewModel((` y
>((y z
(((z {
string	(({ �
.
((� �
Empty
((� �
)
((� �
;
((� �
return++ 
result++ 
;++ 
},, 	
public.. !
OperationResultListVo.. $
<..$ %%
NotificationItemViewModel..% >
>..> ?
GetById..@ G
(..G H
Guid..H L
id..M O
)..O P
{// 	!
OperationResultListVo00 !
<00! "%
NotificationItemViewModel00" ;
>00; <
result00= C
=00D E
new00F I!
OperationResultListVo00J _
<00_ `%
NotificationItemViewModel00` y
>00y z
(00z {
string	00{ �
.
00� �
Empty
00� �
)
00� �
;
00� �
return22 
result22 
;22 
}33 	
public55 !
OperationResultListVo55 $
<55$ %%
NotificationItemViewModel55% >
>55> ?
GetByUserId55@ K
(55K L
Guid55L P
userId55Q W
,55W X
int55Y \
count55] b
)55b c
{66 	!
OperationResultListVo77 !
<77! "%
NotificationItemViewModel77" ;
>77; <
result77= C
;77C D
List99 
<99 
Notification99 
>99 
notifications99 ,
=99- .#
_notificationRepository99/ F
.99F G
Get99G J
(99J K
x99K L
=>99M O
x99P Q
.99Q R
UserId99R X
==99Y [
userId99\ b
)99b c
.99c d
OrderByDescending99d u
(99u v
x99v w
=>99x z
x99{ |
.99| }

CreateDate	99} �
)
99� �
.
99� �
Take
99� �
(
99� �
count
99� �
)
99� �
.
99� �
ToList
99� �
(
99� �
)
99� �
;
99� �
List;; 
<;; %
NotificationItemViewModel;; *
>;;* +
tempList;;, 4
=;;5 6
new;;7 :
List;;; ?
<;;? @%
NotificationItemViewModel;;@ Y
>;;Y Z
(;;Z [
);;[ \
;;;\ ]
foreach<< 
(<< 
Notification<< !
notification<<" .
in<</ 1
notifications<<2 ?
)<<? @
{== %
NotificationItemViewModel>> )
vm>>* ,
=>>- .
new>>/ 2%
NotificationItemViewModel>>3 L
{?? 
Id@@ 
=@@ 
notification@@ %
.@@% &
Id@@& (
,@@( )
UserIdAA 
=AA 
notificationAA )
.AA) *
UserIdAA* 0
,AA0 1
TextBB 
=BB 
notificationBB '
.BB' (
TextBB( ,
,BB, -
UrlCC 
=CC 
notificationCC &
.CC& '
UrlCC' *
,CC* +
IsReadDD 
=DD 
notificationDD )
.DD) *
IsReadDD* 0
,DD0 1

CreateDateEE 
=EE  
notificationEE! -
.EE- .

CreateDateEE. 8
,EE8 9
TypeFF 
=FF 
notificationFF '
.FF' (
TypeFF( ,
}GG 
;GG 
tempListII 
.II 
AddII 
(II 
vmII 
)II  
;II  !
}JJ 
resultLL 
=LL 
newLL !
OperationResultListVoLL .
<LL. /%
NotificationItemViewModelLL/ H
>LLH I
(LLI J
tempListLLJ R
)LLR S
;LLS T
returnNN 
resultNN 
;NN 
}OO 	
publicQQ 
OperationResultVoQQ  
RemoveQQ! '
(QQ' (
GuidQQ( ,
idQQ- /
)QQ/ 0
{RR 	
OperationResultVoSS 
resultSS $
=SS% &
newSS' *
OperationResultVoSS+ <
(SS< =
stringSS= C
.SSC D
EmptySSD I
)SSI J
;SSJ K
returnUU 
resultUU 
;UU 
}VV 	
publicXX 
OperationResultVoXX  
<XX  !
GuidXX! %
>XX% &
SaveXX' +
(XX+ ,$
UserPreferencesViewModelXX, D
	viewModelXXE N
)XXN O
{YY 	
OperationResultVoZZ 
<ZZ 
GuidZZ "
>ZZ" #
resultZZ$ *
=ZZ+ ,
newZZ- 0
OperationResultVoZZ1 B
<ZZB C
GuidZZC G
>ZZG H
(ZZH I
stringZZI O
.ZZO P
EmptyZZP U
)ZZU V
;ZZV W
return\\ 
result\\ 
;\\ 
}]] 	
OperationResultVo__ 
<__ %
NotificationItemViewModel__ 3
>__3 4
ICrudAppService__5 D
<__D E%
NotificationItemViewModel__E ^
>__^ _
.___ `
GetById__` g
(__g h
Guid__h l
id__m o
)__o p
{`` 	
throwaa 
newaa #
NotImplementedExceptionaa -
(aa- .
)aa. /
;aa/ 0
}bb 	
publicdd 
OperationResultVodd  
<dd  !
Guiddd! %
>dd% &
Savedd' +
(dd+ ,%
NotificationItemViewModeldd, E
	viewModelddF O
)ddO P
{ee 	
OperationResultVoff 
<ff 
Guidff "
>ff" #
resultff$ *
;ff* +
tryhh 
{ii 
Notificationjj 
modeljj "
;jj" #
Notificationnn 
existingnn %
=nn& '#
_notificationRepositorynn( ?
.nn? @
GetByIdnn@ G
(nnG H
	viewModelnnH Q
.nnQ R
IdnnR T
)nnT U
;nnU V
ifoo 
(oo 
existingoo 
!=oo 
nulloo  $
)oo$ %
{pp 
modelqq 
=qq 
_mapperqq #
.qq# $
Mapqq$ '
(qq' (
	viewModelqq( 1
,qq1 2
existingqq3 ;
)qq; <
;qq< =
}rr 
elsess 
{tt 
modeluu 
=uu 
_mapperuu #
.uu# $
Mapuu$ '
<uu' (
Notificationuu( 4
>uu4 5
(uu5 6
	viewModeluu6 ?
)uu? @
;uu@ A
}vv 
ifxx 
(xx 
	viewModelxx 
.xx 
Idxx  
==xx! #
Guidxx$ (
.xx( )
Emptyxx) .
)xx. /
{yy #
_notificationRepositoryzz +
.zz+ ,
Addzz, /
(zz/ 0
modelzz0 5
)zz5 6
;zz6 7
	viewModel{{ 
.{{ 
Id{{  
={{! "
model{{# (
.{{( )
Id{{) +
;{{+ ,
}|| 
else}} 
{~~ #
_notificationRepository +
.+ ,
Update, 2
(2 3
model3 8
)8 9
;9 :
}
�� 
_unitOfWork
�� 
.
�� 
Commit
�� "
(
��" #
)
��# $
;
��$ %
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
model
��5 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
ex
��5 7
.
��7 8
Message
��8 ?
)
��? @
;
��@ A
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  
Notify
��! '
(
��' (
Guid
��( ,
targetUserId
��- 9
,
��9 :
NotificationType
��; K
notificationType
��L \
,
��\ ]
Guid
��^ b
likedId
��c j
,
��j k
string
��l r
text
��s w
,
��w x
string
��y 
url��� �
)��� �
{
�� 	'
NotificationItemViewModel
�� %
vm
��& (
=
��) *
new
��+ .'
NotificationItemViewModel
��/ H
(
��H I
)
��I J
;
��J K
vm
�� 
.
�� 
UserId
�� 
=
�� 
targetUserId
�� $
;
��$ %
vm
�� 
.
�� 
Text
�� 
=
�� 
text
�� 
;
�� 
vm
�� 
.
�� 
Url
�� 
=
�� 
url
�� 
;
�� 
vm
�� 
.
�� 
Type
�� 
=
�� 
notificationType
�� &
;
��& '
OperationResultVo
�� 
<
�� 
Guid
�� "
>
��" #

saveResult
��$ .
=
��/ 0
this
��1 5
.
��5 6
Save
��6 :
(
��: ;
vm
��; =
)
��= >
;
��> ?
return
�� 

saveResult
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  

MarkAsRead
��! +
(
��+ ,
Guid
��, 0
id
��1 3
)
��3 4
{
�� 	
OperationResultVo
�� 
result
�� $
=
��% &
new
��' *
OperationResultVo
��+ <
(
��< =
true
��= A
)
��A B
;
��B C
try
�� 
{
�� 
Notification
�� 
notification
�� )
=
��* +%
_notificationRepository
��, C
.
��C D
GetById
��D K
(
��K L
id
��L N
)
��N O
;
��O P
if
�� 
(
�� 
notification
��  
!=
��! #
null
��$ (
)
��( )
{
�� 
notification
��  
.
��  !
IsRead
��! '
=
��( )
true
��* .
;
��. /%
_notificationRepository
�� +
.
��+ ,
Update
��, 2
(
��2 3
notification
��3 ?
)
��? @
;
��@ A
_unitOfWork
�� 
.
��  
Commit
��  &
(
��& '
)
��' (
;
��( )
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
(
��. /
ex
��/ 1
.
��1 2
Message
��2 9
)
��9 :
;
��: ;
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
nC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Services\ProfileAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #
Services# +
{ 
public 

class 
ProfileAppService "
:# $
BaseAppService% 3
,3 4
IProfileAppService5 G
{ 
private 
readonly 
IMapper  
mapper! '
;' (
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
private 
readonly 
IProfileRepository +

repository, 6
;6 7
private 
readonly 
IGameRepository (
gameRepository) 7
;7 8
private 
readonly "
IUserContentRepository /!
userContentRepository0 E
;E F
private 
readonly )
IUserContentCommentRepository 6(
userContentCommentRepository7 S
;S T
private 
readonly (
IBrainstormCommentRepository 5'
brainstormCommentRepository6 Q
;Q R
private 
readonly &
IGamificationDomainService 3%
gamificationDomainService4 M
;M N
private 
readonly $
IUserFollowDomainService 1#
userFollowDomainService2 I
;I J
private 
readonly (
IUserConnectionDomainService 5'
userConnectionDomainService6 Q
;Q R
public 
Guid 
CurrentUserId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public!! 
ProfileAppService!!  
(!!  !
IMapper!!! (
mapper!!) /
,!!/ 0
IUnitOfWork!!1 <

unitOfWork!!= G
,!!G H
IProfileRepository!!I [

repository!!\ f
,!!f g
IGameRepository!!h w
gameRepository	!!x �
,
!!� �$
IUserContentRepository
!!� �#
userContentRepository
!!� �
,"" )
IUserContentCommentRepository"" +(
userContentCommentRepository"", H
,## (
IBrainstormCommentRepository## *&
brainstormCommentRepositor##+ E
,$$ &
IGamificationDomainService$$ (%
gamificationDomainService$$) B
,%% $
IUserFollowDomainService%% &#
userFollowDomainService%%' >
,&& (
IUserConnectionDomainService&& *'
userConnectionDomainService&&+ F
)&&F G
{'' 	
this(( 
.(( 
mapper(( 
=(( 
mapper((  
;((  !
this)) 
.)) 

unitOfWork)) 
=)) 

unitOfWork)) (
;))( )
this** 
.** 

repository** 
=** 

repository** (
;**( )
this++ 
.++ 
gameRepository++ 
=++  !
gameRepository++" 0
;++0 1
this,, 
.,, !
userContentRepository,, &
=,,' (!
userContentRepository,,) >
;,,> ?
this-- 
.-- (
userContentCommentRepository-- -
=--. /(
userContentCommentRepository--0 L
;--L M
this.. 
... '
brainstormCommentRepository.. ,
=..- .&
brainstormCommentRepositor../ I
;..I J
this// 
.// %
gamificationDomainService// *
=//+ ,%
gamificationDomainService//- F
;//F G
this00 
.00 #
userFollowDomainService00 (
=00) *#
userFollowDomainService00+ B
;00B C
this11 
.11 '
userConnectionDomainService11 ,
=11- .'
userConnectionDomainService11/ J
;11J K
}22 	
public55 
OperationResultVo55  
<55  !
int55! $
>55$ %
Count55& +
(55+ ,
)55, -
{66 	
OperationResultVo77 
<77 
int77 !
>77! "
result77# )
;77) *
try99 
{:: 
int;; 
count;; 
=;; 

repository;; &
.;;& '
GetAll;;' -
(;;- .
);;. /
.;;/ 0
Count;;0 5
(;;5 6
);;6 7
;;;7 8
result== 
=== 
new== 
OperationResultVo== .
<==. /
int==/ 2
>==2 3
(==3 4
count==4 9
)==9 :
;==: ;
}>> 
catch?? 
(?? 
	Exception?? 
ex?? 
)??  
{@@ 
resultAA 
=AA 
newAA 
OperationResultVoAA .
<AA. /
intAA/ 2
>AA2 3
(AA3 4
exAA4 6
.AA6 7
MessageAA7 >
)AA> ?
;AA? @
}BB 
returnDD 
resultDD 
;DD 
}EE 	
publicGG !
OperationResultListVoGG $
<GG$ %
ProfileViewModelGG% 5
>GG5 6
GetAllGG7 =
(GG= >
)GG> ?
{HH 	!
OperationResultListVoII !
<II! "
ProfileViewModelII" 2
>II2 3
resultII4 :
;II: ;
tryKK 
{LL 

IQueryableMM 
<MM 
UserProfileMM &
>MM& '
	allModelsMM( 1
=MM2 3

repositoryMM4 >
.MM> ?
GetAllMM? E
(MME F
)MMF G
;MMG H
IEnumerableOO 
<OO 
ProfileViewModelOO ,
>OO, -
vmsOO. 1
=OO2 3
mapperOO4 :
.OO: ;
MapOO; >
<OO> ?
IEnumerableOO? J
<OOJ K
UserProfileOOK V
>OOV W
,OOW X
IEnumerableOOY d
<OOd e
ProfileViewModelOOe u
>OOu v
>OOv w
(OOw x
	allModels	OOx �
)
OO� �
;
OO� �
resultQQ 
=QQ 
newQQ !
OperationResultListVoQQ 2
<QQ2 3
ProfileViewModelQQ3 C
>QQC D
(QQD E
vmsQQE H
)QQH I
;QQI J
}RR 
catchSS 
(SS 
	ExceptionSS 
exSS 
)SS  
{TT 
resultUU 
=UU 
newUU !
OperationResultListVoUU 2
<UU2 3
ProfileViewModelUU3 C
>UUC D
(UUD E
exUUE G
.UUG H
MessageUUH O
)UUO P
;UUP Q
}VV 
returnXX 
resultXX 
;XX 
}YY 	
public[[ 
OperationResultVo[[  
<[[  !
ProfileViewModel[[! 1
>[[1 2
GetById[[3 :
([[: ;
Guid[[; ?
id[[@ B
)[[B C
{\\ 	
OperationResultVo]] 
<]] 
ProfileViewModel]] .
>]]. /
result]]0 6
;]]6 7
try__ 
{`` 
UserProfileaa 
modelaa !
=aa" #

repositoryaa$ .
.aa. /
GetByIdaa/ 6
(aa6 7
idaa7 9
)aa9 :
;aa: ;
ProfileViewModelcc  
vmcc! #
=cc$ %
mappercc& ,
.cc, -
Mapcc- 0
<cc0 1
ProfileViewModelcc1 A
>ccA B
(ccB C
modelccC H
)ccH I
;ccI J
resultee 
=ee 
newee 
OperationResultVoee .
<ee. /
ProfileViewModelee/ ?
>ee? @
(ee@ A
vmeeA C
)eeC D
;eeD E
}ff 
catchgg 
(gg 
	Exceptiongg 
exgg 
)gg  
{hh 
resultii 
=ii 
newii 
OperationResultVoii .
<ii. /
ProfileViewModelii/ ?
>ii? @
(ii@ A
exiiA C
.iiC D
MessageiiD K
)iiK L
;iiL M
}jj 
returnll 
resultll 
;ll 
}mm 	
publicoo 
OperationResultVooo  
Removeoo! '
(oo' (
Guidoo( ,
idoo- /
)oo/ 0
{pp 	
OperationResultVoqq 
resultqq $
;qq$ %
tryss 
{tt 

repositoryww 
.ww 
Removeww !
(ww! "
idww" $
)ww$ %
;ww% &

unitOfWorkyy 
.yy 
Commityy !
(yy! "
)yy" #
;yy# $
result{{ 
={{ 
new{{ 
OperationResultVo{{ .
({{. /
true{{/ 3
){{3 4
;{{4 5
}|| 
catch}} 
(}} 
	Exception}} 
ex}} 
)}}  
{~~ 
result 
= 
new 
OperationResultVo .
(. /
ex/ 1
.1 2
Message2 9
)9 :
;: ;
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  
<
��  !
Guid
��! %
>
��% &
Save
��' +
(
��+ ,
ProfileViewModel
��, <
	viewModel
��= F
)
��F G
{
�� 	
OperationResultVo
�� 
<
�� 
Guid
�� "
>
��" #
result
��$ *
;
��* +
try
�� 
{
�� 
UserProfile
�� 
model
�� !
;
��! "
	viewModel
�� 
.
�� 
GameJoltUrl
�� %
=
��& '
	viewModel
��( 1
.
��1 2
GameJoltUrl
��2 =
?
��= >
.
��> ?
	TrimStart
��? H
(
��H I
$char
��I L
)
��L M
;
��M N
UserProfile
�� 
existing
�� $
=
��% &

repository
��' 1
.
��1 2
GetById
��2 9
(
��9 :
	viewModel
��: C
.
��C D
Id
��D F
)
��F G
;
��G H
if
�� 
(
�� 
existing
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
model
�� 
=
�� 
mapper
�� "
.
��" #
Map
��# &
(
��& '
	viewModel
��' 0
,
��0 1
existing
��2 :
)
��: ;
;
��; <
}
�� 
else
�� 
{
�� 
model
�� 
=
�� 
mapper
�� "
.
��" #
Map
��# &
<
��& '
UserProfile
��' 2
>
��2 3
(
��3 4
	viewModel
��4 =
)
��= >
;
��> ?
}
�� 
if
�� 
(
�� 
model
�� 
.
�� 
Type
�� 
==
�� !
$num
��" #
)
��# $
{
�� 
model
�� 
.
�� 
Type
�� 
=
��  
ProfileType
��! ,
.
��, -
Personal
��- 5
;
��5 6
}
�� 
if
�� 
(
�� 
	viewModel
�� 
.
�� 
Id
��  
==
��! #
Guid
��$ (
.
��( )
Empty
��) .
)
��. /
{
�� 

repository
�� 
.
�� 
Add
�� "
(
��" #
model
��# (
)
��( )
;
��) *
	viewModel
�� 
.
�� 
Id
��  
=
��! "
model
��# (
.
��( )
Id
��) +
;
��+ ,
}
�� 
else
�� 
{
�� 

repository
�� 
.
�� 
Update
�� %
(
��% &
model
��& +
)
��+ ,
;
��, -
}
�� 

IQueryable
�� 
<
�� 
Game
�� 
>
��  
games
��! &
=
��' (
gameRepository
��) 7
.
��7 8
GetAll
��8 >
(
��> ?
)
��? @
.
��@ A
Where
��A F
(
��F G
x
��G H
=>
��I K
x
��L M
.
��M N
UserId
��N T
==
��U W
	viewModel
��X a
.
��a b
UserId
��b h
)
��h i
;
��i j
foreach
�� 
(
�� 
Game
�� 
g
�� 
in
��  "
games
��# (
)
��( )
{
�� 
g
�� 
.
�� 
DeveloperName
�� #
=
��$ %
	viewModel
��& /
.
��/ 0
Name
��0 4
;
��4 5
}
�� 

IQueryable
�� 
<
�� 
UserContent
�� &
>
��& '
posts
��( -
=
��. /#
userContentRepository
��0 E
.
��E F
GetAll
��F L
(
��L M
)
��M N
.
��N O
Where
��O T
(
��T U
x
��U V
=>
��W Y
x
��Z [
.
��[ \
UserId
��\ b
==
��c e
	viewModel
��f o
.
��o p
UserId
��p v
)
��v w
;
��w x
foreach
�� 
(
�� 
UserContent
�� $
p
��% &
in
��' )
posts
��* /
)
��/ 0
{
�� 
p
�� 
.
�� 

AuthorName
��  
=
��! "
	viewModel
��# ,
.
��, -
Name
��- 1
;
��1 2
}
�� 

IQueryable
�� 
<
��  
UserContentComment
�� -
>
��- .
comments
��/ 7
=
��8 9*
userContentCommentRepository
��: V
.
��V W
GetAll
��W ]
(
��] ^
)
��^ _
.
��_ `
Where
��` e
(
��e f
x
��f g
=>
��h j
x
��k l
.
��l m
UserId
��m s
==
��t v
	viewModel��w �
.��� �
UserId��� �
)��� �
;��� �
foreach
�� 
(
��  
UserContentComment
�� +
c
��, -
in
��. 0
comments
��1 9
)
��9 :
{
�� 
c
�� 
.
�� 

AuthorName
��  
=
��! "
	viewModel
��# ,
.
��, -
Name
��- 1
;
��1 2
}
�� 

IQueryable
�� 
<
�� 
BrainstormComment
�� ,
>
��, - 
brainstormComments
��. @
=
��A B)
brainstormCommentRepository
��C ^
.
��^ _
GetAll
��_ e
(
��e f
)
��f g
.
��g h
Where
��h m
(
��m n
x
��n o
=>
��p r
x
��s t
.
��t u
UserId
��u {
==
��| ~
	viewModel�� �
.��� �
UserId��� �
)��� �
;��� �
foreach
�� 
(
�� 
BrainstormComment
�� *
bc
��+ -
in
��. 0 
brainstormComments
��1 C
)
��C D
{
�� 
bc
�� 
.
�� 

AuthorName
�� !
=
��" #
	viewModel
��$ -
.
��- .
Name
��. 2
;
��2 3
}
�� 

unitOfWork
�� 
.
�� 
Commit
�� !
(
��! "
)
��" #
;
��# $
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
model
��5 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
ex
��5 7
.
��7 8
Message
��8 ?
)
��? @
;
��@ A
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
ProfileViewModel
�� 
GetByUserId
��  +
(
��+ ,
Guid
��, 0
userId
��1 7
,
��7 8
ProfileType
��9 D
type
��E I
)
��I J
{
�� 	
return
�� 
GetByUserId
�� 
(
�� 
userId
�� %
,
��% &
userId
��' -
,
��- .
type
��/ 3
)
��3 4
;
��4 5
}
�� 	
public
�� 
ProfileViewModel
�� 
GetByUserId
��  +
(
��+ ,
Guid
��, 0
currentUserId
��1 >
,
��> ?
Guid
��@ D
userId
��E K
,
��K L
ProfileType
��M X
type
��Y ]
)
��] ^
{
�� 	
ProfileViewModel
�� 
vm
�� 
=
��  !
new
��" %
ProfileViewModel
��& 6
(
��6 7
)
��7 8
;
��8 9
IEnumerable
�� 
<
�� 
UserProfile
�� #
>
��# $
profiles
��% -
=
��. /

repository
��0 :
.
��: ;
GetByUserId
��; F
(
��F G
userId
��G M
)
��M N
;
��N O
UserProfile
�� 
model
�� 
=
�� 
profiles
��  (
.
��( )
FirstOrDefault
��) 7
(
��7 8
x
��8 9
=>
��: <
x
��= >
.
��> ?
Type
��? C
==
��D F
type
��G K
)
��K L
;
��L M
if
�� 
(
�� 
profiles
�� 
.
�� 
Any
�� 
(
�� 
)
�� 
&&
�� !
model
��" '
!=
��( *
null
��+ /
)
��/ 0
{
�� 
vm
�� 
=
�� 
mapper
�� 
.
�� 
Map
�� 
(
��  
model
��  %
,
��% &
vm
��' )
)
��) *
;
��* +
}
�� 
else
�� 
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
vm
�� 
.
�� 
CoverImageUrl
�� 
=
�� 
UrlFormatter
�� +
.
��+ ,
ProfileCoverImage
��, =
(
��= >
vm
��> @
.
��@ A
UserId
��A G
,
��G H
vm
��I K
.
��K L
Id
��L N
)
��N O
;
��O P
vm
�� 
.
�� 
ProfileImageUrl
�� 
=
��  
UrlFormatter
��! -
.
��- .
ProfileImage
��. :
(
��: ;
vm
��; =
.
��= >
UserId
��> D
)
��D E
;
��E F'
FormatExternalNetworkUrls
�� %
(
��% &
vm
��& (
)
��( )
;
��) *
vm
�� 
.
�� 
Counters
�� 
.
�� 
Games
�� 
=
�� 
gameRepository
��  .
.
��. /
Count
��/ 4
(
��4 5
x
��5 6
=>
��7 9
x
��: ;
.
��; <
UserId
��< B
==
��C E
vm
��F H
.
��H I
UserId
��I O
)
��O P
;
��P Q
vm
�� 
.
�� 
Counters
�� 
.
�� 
Posts
�� 
=
�� #
userContentRepository
��  5
.
��5 6
Count
��6 ;
(
��; <
x
��< =
=>
��> @
x
��A B
.
��B C
UserId
��C I
==
��J L
vm
��M O
.
��O P
UserId
��P V
)
��V W
;
��W X
vm
�� 
.
�� 
Counters
�� 
.
�� 
Comments
��  
=
��! "*
userContentCommentRepository
��# ?
.
��? @
Count
��@ E
(
��E F
x
��F G
=>
��H J
x
��K L
.
��L M
UserId
��M S
==
��T V
vm
��W Y
.
��Y Z
UserId
��Z `
)
��` a
;
��a b
Gamification
�� 
gamification
�� %
=
��& '
this
��( ,
.
��, -'
gamificationDomainService
��- F
.
��F G%
GetGamificationByUserId
��G ^
(
��^ _
userId
��_ e
)
��e f
;
��f g

unitOfWork
�� 
.
�� 
Commit
�� 
(
�� 
)
�� 
;
��  
GamificationLevel
�� 
currentLevel
�� *
=
��+ ,
this
��- 1
.
��1 2'
gamificationDomainService
��2 K
.
��K L
GetLevel
��L T
(
��T U
gamification
��U a
.
��a b 
CurrentLevelNumber
��b t
)
��t u
;
��u v
vm
�� 
.
�� 
IndieXp
�� 
.
�� 
	LevelName
��  
=
��! "
currentLevel
��# /
.
��/ 0
Name
��0 4
;
��4 5
vm
�� 
.
�� 
IndieXp
�� 
.
�� 
Level
�� 
=
�� 
gamification
�� +
.
��+ , 
CurrentLevelNumber
��, >
;
��> ?
vm
�� 
.
�� 
IndieXp
�� 
.
�� 
LevelXp
�� 
=
��  
gamification
��! -
.
��- .
XpCurrentLevel
��. <
;
��< =
vm
�� 
.
�� 
IndieXp
�� 
.
�� 
NextLevelXp
�� "
=
��# $
gamification
��% 1
.
��1 2
XpToNextLevel
��2 ?
+
��@ A
gamification
��B N
.
��N O
XpCurrentLevel
��O ]
;
��] ^
vm
�� 
.
�� 
Counters
�� 
.
�� 
	Followers
�� !
=
��" #
this
��$ (
.
��( )%
userFollowDomainService
��) @
.
��@ A
Count
��A F
(
��F G
x
��G H
=>
��I K
x
��L M
.
��M N
FollowUserId
��N Z
==
��[ ]
vm
��^ `
.
��` a
UserId
��a g
)
��g h
;
��h i
vm
�� 
.
�� 
Counters
�� 
.
�� 
	Following
�� !
=
��" #
this
��$ (
.
��( )%
userFollowDomainService
��) @
.
��@ A
Count
��A F
(
��F G
x
��G H
=>
��I K
x
��L M
.
��M N
UserId
��N T
==
��U W
currentUserId
��X e
)
��e f
;
��f g
var
�� 
connectionsToUser
�� !
=
��" #
this
��$ (
.
��( ))
userConnectionDomainService
��) D
.
��D E
Count
��E J
(
��J K
x
��K L
=>
��M O
x
��P Q
.
��Q R
TargetUserId
��R ^
==
��_ a
vm
��b d
.
��d e
UserId
��e k
&&
��l n
x
��o p
.
��p q
ApprovalDate
��q }
.
��} ~
HasValue��~ �
)��� �
;��� �
var
�� !
connectionsFromUser
�� #
=
��$ %
this
��& *
.
��* +)
userConnectionDomainService
��+ F
.
��F G
Count
��G L
(
��L M
x
��M N
=>
��O Q
x
��R S
.
��S T
UserId
��T Z
==
��[ ]
vm
��^ `
.
��` a
UserId
��a g
&&
��h j
x
��k l
.
��l m
ApprovalDate
��m y
.
��y z
HasValue��z �
)��� �
;��� �
vm
�� 
.
�� 
Counters
�� 
.
�� 
Connections
�� #
=
��$ %
connectionsToUser
��& 7
+
��8 9!
connectionsFromUser
��: M
;
��M N
vm
�� 
.
�� "
CurrentUserFollowing
�� #
=
��$ %
this
��& *
.
��* +%
userFollowDomainService
��+ B
.
��B C
Get
��C F
(
��F G
x
��G H
=>
��I K
x
��L M
.
��M N
UserId
��N T
==
��U W
currentUserId
��X e
&&
��f h
x
��i j
.
��j k
FollowUserId
��k w
==
��x z
vm
��{ }
.
��} ~
UserId��~ �
)��� �
.��� �
Any��� �
(��� �
)��� �
;��� �
vm
�� 
.
�� 
ConnectionControl
��  
.
��  !"
CurrentUserConnected
��! 5
=
��6 7
this
��8 <
.
��< =)
userConnectionDomainService
��= X
.
��X Y
CheckConnection
��Y h
(
��h i
currentUserId
��i v
,
��v w
vm
��x z
.
��z {
UserId��{ �
,��� �
true��� �
,��� �
true��� �
)��� �
;��� �
vm
�� 
.
�� 
ConnectionControl
��  
.
��  !(
CurrentUserWantsToFollowMe
��! ;
=
��< =
this
��> B
.
��B C)
userConnectionDomainService
��C ^
.
��^ _
CheckConnection
��_ n
(
��n o
vm
��o q
.
��q r
UserId
��r x
,
��x y
currentUserId��z �
,��� �
false��� �
,��� �
false��� �
)��� �
;��� �
vm
�� 
.
�� 
ConnectionControl
��  
.
��  !!
ConnectionIsPending
��! 4
=
��5 6
this
��7 ;
.
��; <)
userConnectionDomainService
��< W
.
��W X
CheckConnection
��X g
(
��g h
currentUserId
��h u
,
��u v
vm
��w y
.
��y z
UserId��z �
,��� �
false��� �
,��� �
true��� �
)��� �
;��� �
return
�� 
vm
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
void
�� '
FormatExternalNetworkUrls
�� 5
(
��5 6
ProfileViewModel
��6 F
vm
��G I
)
��I J
{
�� 	
if
�� 
(
�� 
!
�� 
string
�� 
.
��  
IsNullOrWhiteSpace
�� *
(
��* +
vm
��+ -
.
��- .
	ItchIoUrl
��. 7
)
��7 8
)
��8 9
{
�� 
vm
�� 
.
�� 
	ItchIoUrl
�� 
=
�� 
vm
�� !
.
��! "
	ItchIoUrl
��" +
.
��+ ,
ToLower
��, 3
(
��3 4
)
��4 5
.
��5 6
Replace
��6 =
(
��= >
$str
��> A
,
��A B
$str
��C F
)
��F G
;
��G H
if
�� 
(
�� 
!
�� 
vm
�� 
.
�� 
	ItchIoUrl
�� !
.
��! "
EndsWith
��" *
(
��* +
$str
��+ 4
)
��4 5
)
��5 6
{
�� 
vm
�� 
.
�� 
	ItchIoUrl
��  
=
��! "
$str
��# -
+
��. /
vm
��0 2
.
��2 3
	ItchIoUrl
��3 <
+
��= >
$str
��? I
;
��I J
}
�� 
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
��  
IsNullOrWhiteSpace
�� *
(
��* +
vm
��+ -
.
��- .
GameJoltUrl
��. 9
)
��9 :
)
��: ;
{
�� 
vm
�� 
.
�� 
GameJoltUrl
�� 
=
��  
vm
��! #
.
��# $
GameJoltUrl
��$ /
.
��/ 0
ToLower
��0 7
(
��7 8
)
��8 9
.
��9 :
Replace
��: A
(
��A B
$str
��B E
,
��E F
$str
��G J
)
��J K
;
��K L
if
�� 
(
�� 
!
�� 
vm
�� 
.
�� 
GameJoltUrl
�� #
.
��# $
EndsWith
��$ ,
(
��, -
$str
��- 6
)
��6 7
)
��7 8
{
�� 
vm
�� 
.
�� 
GameJoltUrl
�� "
=
��# $
$str
��% =
+
��> ?
vm
��@ B
.
��B C
GameJoltUrl
��C N
;
��N O
}
�� 
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
��  
IsNullOrWhiteSpace
�� *
(
��* +
vm
��+ -
.
��- .
UnityConnectUrl
��. =
)
��= >
)
��> ?
{
�� 
vm
�� 
.
�� 
UnityConnectUrl
�� "
=
��# $
vm
��% '
.
��' (
UnityConnectUrl
��( 7
.
��7 8
ToLower
��8 ?
(
��? @
)
��@ A
.
��A B
Replace
��B I
(
��I J
$str
��J M
,
��M N
$str
��O R
)
��R S
;
��S T
if
�� 
(
�� 
!
�� 
vm
�� 
.
�� 
UnityConnectUrl
�� '
.
��' (
EndsWith
��( 0
(
��0 1
$str
��1 :
)
��: ;
)
��; <
{
�� 
vm
�� 
.
�� 
UnityConnectUrl
�� &
=
��' (
$str
��) G
+
��H I
vm
��J L
.
��L M
UnityConnectUrl
��M \
;
��\ ]
}
�� 
}
�� 
}
�� 	
public
�� 
ProfileViewModel
�� 
GenerateNewOne
��  .
(
��. /
ProfileType
��/ :
type
��; ?
)
��? @
{
�� 	
ProfileViewModel
�� 
profile
�� $
=
��% &
new
��' *
ProfileViewModel
��+ ;
(
��; <
)
��< =
;
��= >
Random
�� 
r
�� 
=
�� 
new
�� 
Random
�� !
(
��! "
(
��" #
int
��# &
)
��& '
DateTime
��' /
.
��/ 0
Now
��0 3
.
��3 4
Ticks
��4 9
)
��9 :
;
��: ;
profile
�� 
.
�� 
Type
�� 
=
�� 
ProfileType
�� &
.
��& '
Personal
��' /
;
��/ 0
profile
�� 
.
�� 
Name
�� 
=
�� 
$str
�� !
+
��" #
r
��$ %
.
��% &
Next
��& *
(
��* +
$num
��+ -
,
��- .
$num
��/ 3
)
��3 4
.
��4 5
ToString
��5 =
(
��= >
)
��> ?
;
��? @
profile
�� 
.
�� 
Motto
�� 
=
�� 
$str
�� E
;
��E F
profile
�� 
.
�� 
Bio
�� 
=
�� 
profile
�� !
.
��! "
Name
��" &
+
��' (
$str
��) |
;
��| }
profile
�� 
.
�� 

StudioName
�� 
=
��  
$str
��! 6
;
��6 7
profile
�� 
.
�� 
Location
�� 
=
�� 
$str
�� )
;
��) *
profile
�� 
.
�� 
ProfileImageUrl
�� #
=
��$ %
	Constants
��& /
.
��/ 0
DefaultAvatar
��0 =
;
��= >
profile
�� 
.
�� 
CoverImageUrl
�� !
=
��" #
	Constants
��$ -
.
��- .#
DefaultGameCoverImage
��. C
;
��C D
return
�� 
profile
�� 
;
�� 
}
�� 	
}
�� 
}�� �Y
pC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Services\UserBadgeAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #
Services# +
{ 
public 

class 
UserBadgeAppService $
:% & 
IUserBadgeAppService' ;
{ 
private 
readonly 
IMapper  
mapper! '
;' (
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
private 
readonly #
IUserBadgeDomainService 0"
userBadgeDomainService1 G
;G H
public 
Guid 
CurrentUserId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
UserBadgeAppService "
(" #
IMapper# *
mapper+ 1
,1 2
IUnitOfWork3 >

unitOfWork? I
,I J#
IUserBadgeDomainServiceK b"
userBadgeDomainServicec y
)y z
{ 	
this 
. 
mapper 
= 
mapper  
;  !
this 
. 

unitOfWork 
= 

unitOfWork (
;( )
this 
. "
userBadgeDomainService '
=( )"
userBadgeDomainService* @
;@ A
} 	
public 
OperationResultVo  
<  !
int! $
>$ %
Count& +
(+ ,
), -
{ 	
OperationResultVo 
< 
int !
>! "
result# )
;) *
try   
{!! 
int"" 
count"" 
="" "
userBadgeDomainService"" 2
.""2 3
Count""3 8
(""8 9
)""9 :
;"": ;
result$$ 
=$$ 
new$$ 
OperationResultVo$$ .
<$$. /
int$$/ 2
>$$2 3
($$3 4
count$$4 9
)$$9 :
;$$: ;
}%% 
catch&& 
(&& 
	Exception&& 
ex&& 
)&&  
{'' 
result(( 
=(( 
new(( 
OperationResultVo(( .
<((. /
int((/ 2
>((2 3
(((3 4
ex((4 6
.((6 7
Message((7 >
)((> ?
;((? @
})) 
return++ 
result++ 
;++ 
},, 	
public.. !
OperationResultListVo.. $
<..$ %
UserBadgeViewModel..% 7
>..7 8
GetAll..9 ?
(..? @
)..@ A
{// 	!
OperationResultListVo00 !
<00! "
UserBadgeViewModel00" 4
>004 5
result006 <
;00< =
try22 
{33 
IEnumerable44 
<44 
	UserBadge44 %
>44% &
	allModels44' 0
=441 2"
userBadgeDomainService443 I
.44I J
GetAll44J P
(44P Q
)44Q R
;44R S
IEnumerable66 
<66 
UserBadgeViewModel66 .
>66. /
vms660 3
=664 5
mapper666 <
.66< =
Map66= @
<66@ A
IEnumerable66A L
<66L M
	UserBadge66M V
>66V W
,66W X
IEnumerable66Y d
<66d e
UserBadgeViewModel66e w
>66w x
>66x y
(66y z
	allModels	66z �
)
66� �
;
66� �
result88 
=88 
new88 !
OperationResultListVo88 2
<882 3
UserBadgeViewModel883 E
>88E F
(88F G
vms88G J
)88J K
;88K L
}99 
catch:: 
(:: 
	Exception:: 
ex:: 
)::  
{;; 
result<< 
=<< 
new<< !
OperationResultListVo<< 2
<<<2 3
UserBadgeViewModel<<3 E
><<E F
(<<F G
ex<<G I
.<<I J
Message<<J Q
)<<Q R
;<<R S
}== 
return?? 
result?? 
;?? 
}@@ 	
publicBB 
OperationResultVoBB  
<BB  !
UserBadgeViewModelBB! 3
>BB3 4
GetByIdBB5 <
(BB< =
GuidBB= A
idBBB D
)BBD E
{CC 	
OperationResultVoDD 
<DD 
UserBadgeViewModelDD 0
>DD0 1
resultDD2 8
;DD8 9
tryFF 
{GG 
	UserBadgeHH 
modelHH 
=HH  !"
userBadgeDomainServiceHH" 8
.HH8 9
GetByIdHH9 @
(HH@ A
idHHA C
)HHC D
;HHD E
UserBadgeViewModelJJ "
vmJJ# %
=JJ& '
mapperJJ( .
.JJ. /
MapJJ/ 2
<JJ2 3
UserBadgeViewModelJJ3 E
>JJE F
(JJF G
modelJJG L
)JJL M
;JJM N
resultLL 
=LL 
newLL 
OperationResultVoLL .
<LL. /
UserBadgeViewModelLL/ A
>LLA B
(LLB C
vmLLC E
)LLE F
;LLF G
}MM 
catchNN 
(NN 
	ExceptionNN 
exNN 
)NN  
{OO 
resultPP 
=PP 
newPP 
OperationResultVoPP .
<PP. /
UserBadgeViewModelPP/ A
>PPA B
(PPB C
exPPC E
.PPE F
MessagePPF M
)PPM N
;PPN O
}QQ 
returnSS 
resultSS 
;SS 
}TT 	
publicVV !
OperationResultListVoVV $
<VV$ %
UserBadgeViewModelVV% 7
>VV7 8
	GetByUserVV9 B
(VVB C
GuidVVC G
userIdVVH N
)VVN O
{WW 	!
OperationResultListVoXX !
<XX! "
UserBadgeViewModelXX" 4
>XX4 5
resultXX6 <
;XX< =
tryZZ 
{[[ 
IEnumerable\\ 
<\\ 
	UserBadge\\ %
>\\% &
	allModels\\' 0
=\\1 2"
userBadgeDomainService\\3 I
.\\I J
GetByUserId\\J U
(\\U V
userId\\V \
)\\\ ]
;\\] ^
IEnumerable^^ 
<^^ 
UserBadgeViewModel^^ .
>^^. /
vms^^0 3
=^^4 5
mapper^^6 <
.^^< =
Map^^= @
<^^@ A
IEnumerable^^A L
<^^L M
	UserBadge^^M V
>^^V W
,^^W X
IEnumerable^^Y d
<^^d e
UserBadgeViewModel^^e w
>^^w x
>^^x y
(^^y z
	allModels	^^z �
)
^^� �
;
^^� �
result`` 
=`` 
new`` !
OperationResultListVo`` 2
<``2 3
UserBadgeViewModel``3 E
>``E F
(``F G
vms``G J
)``J K
;``K L
}aa 
catchbb 
(bb 
	Exceptionbb 
exbb 
)bb  
{cc 
resultdd 
=dd 
newdd !
OperationResultListVodd 2
<dd2 3
UserBadgeViewModeldd3 E
>ddE F
(ddF G
exddG I
.ddI J
MessageddJ Q
)ddQ R
;ddR S
}ee 
returngg 
resultgg 
;gg 
}hh 	
publicjj 
OperationResultVojj  
<jj  !
Guidjj! %
>jj% &
Savejj' +
(jj+ ,
UserBadgeViewModeljj, >
	viewModeljj? H
)jjH I
{kk 	
OperationResultVoll 
<ll 
Guidll "
>ll" #
resultll$ *
;ll* +
trynn 
{oo 
	UserBadgepp 
modelpp 
;pp  
	UserBadgett 
existingtt "
=tt# $"
userBadgeDomainServicett% ;
.tt; <
GetByIdtt< C
(ttC D
	viewModelttD M
.ttM N
IdttN P
)ttP Q
;ttQ R
ifuu 
(uu 
existinguu 
!=uu 
nulluu  $
)uu$ %
{vv 
modelww 
=ww 
mapperww "
.ww" #
Mapww# &
(ww& '
	viewModelww' 0
,ww0 1
existingww2 :
)ww: ;
;ww; <
}xx 
elseyy 
{zz 
model{{ 
={{ 
mapper{{ "
.{{" #
Map{{# &
<{{& '
	UserBadge{{' 0
>{{0 1
({{1 2
	viewModel{{2 ;
){{; <
;{{< =
}|| 
if~~ 
(~~ 
	viewModel~~ 
.~~ 
Id~~  
==~~! #
Guid~~$ (
.~~( )
Empty~~) .
)~~. /
{ $
userBadgeDomainService
�� *
.
��* +
Add
��+ .
(
��. /
model
��/ 4
)
��4 5
;
��5 6
	viewModel
�� 
.
�� 
Id
��  
=
��! "
model
��# (
.
��( )
Id
��) +
;
��+ ,
}
�� 
else
�� 
{
�� $
userBadgeDomainService
�� *
.
��* +
Update
��+ 1
(
��1 2
model
��2 7
)
��7 8
;
��8 9
}
�� 

unitOfWork
�� 
.
�� 
Commit
�� !
(
��! "
)
��" #
;
��# $
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
model
��5 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
ex
��5 7
.
��7 8
Message
��8 ?
)
��? @
;
��@ A
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  
Remove
��! '
(
��' (
Guid
��( ,
id
��- /
)
��/ 0
{
�� 	
OperationResultVo
�� 
result
�� $
;
��$ %
try
�� 
{
�� $
userBadgeDomainService
�� &
.
��& '
Remove
��' -
(
��- .
id
��. 0
)
��0 1
;
��1 2

unitOfWork
�� 
.
�� 
Commit
�� !
(
��! "
)
��" #
;
��# $
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
(
��. /
true
��/ 3
)
��3 4
;
��4 5
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
(
��. /
ex
��/ 1
.
��1 2
Message
��2 9
)
��9 :
;
��: ;
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
uC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Services\UserConnectionAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #
Services# +
{ 
public 

class $
UserConnectionAppService )
:* +
BaseAppService, :
,: ;%
IUserConnectionAppService< U
{ 
private 
readonly 
IMapper  
mapper! '
;' (
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
private 
readonly (
IUserConnectionDomainService 5'
userConnectionDomainService6 Q
;Q R
public $
UserConnectionAppService '
(' (
IMapper( /
mapper0 6
,6 7
IUnitOfWork8 C

unitOfWorkD N
, (
IUserConnectionDomainService *'
userConnectionDomainService+ F
)F G
{ 	
this 
. 
mapper 
= 
mapper  
;  !
this 
. 

unitOfWork 
= 

unitOfWork (
;( )
this 
. '
userConnectionDomainService ,
=- .'
userConnectionDomainService/ J
;J K
} 	
public 
OperationResultVo  
<  !
int! $
>$ %
Count& +
(+ ,
), -
{ 	
OperationResultVo 
< 
int !
>! "
result# )
;) *
try   
{!! 
int"" 
count"" 
="" 
this""  
.""  !'
userConnectionDomainService""! <
.""< =
Count""= B
(""B C
)""C D
;""D E
result$$ 
=$$ 
new$$ 
OperationResultVo$$ .
<$$. /
int$$/ 2
>$$2 3
($$3 4
count$$4 9
)$$9 :
;$$: ;
}%% 
catch&& 
(&& 
	Exception&& 
ex&& 
)&&  
{'' 
result(( 
=(( 
new(( 
OperationResultVo(( .
<((. /
int((/ 2
>((2 3
(((3 4
ex((4 6
.((6 7
Message((7 >
)((> ?
;((? @
})) 
return++ 
result++ 
;++ 
},, 	
public.. !
OperationResultListVo.. $
<..$ %#
UserConnectionViewModel..% <
>..< =
GetAll..> D
(..D E
)..E F
{// 	!
OperationResultListVo00 !
<00! "#
UserConnectionViewModel00" 9
>009 :
result00; A
;00A B
try22 
{33 
IEnumerable44 
<44 
UserConnection44 *
>44* +
	allModels44, 5
=446 7
this448 <
.44< ='
userConnectionDomainService44= X
.44X Y
GetAll44Y _
(44_ `
)44` a
;44a b
IEnumerable66 
<66 #
UserConnectionViewModel66 3
>663 4
vms665 8
=669 :
mapper66; A
.66A B
Map66B E
<66E F
IEnumerable66F Q
<66Q R
UserConnection66R `
>66` a
,66a b
IEnumerable66c n
<66n o$
UserConnectionViewModel	66o �
>
66� �
>
66� �
(
66� �
	allModels
66� �
)
66� �
;
66� �
result88 
=88 
new88 !
OperationResultListVo88 2
<882 3#
UserConnectionViewModel883 J
>88J K
(88K L
vms88L O
)88O P
;88P Q
}99 
catch:: 
(:: 
	Exception:: 
ex:: 
)::  
{;; 
result<< 
=<< 
new<< !
OperationResultListVo<< 2
<<<2 3#
UserConnectionViewModel<<3 J
><<J K
(<<K L
ex<<L N
.<<N O
Message<<O V
)<<V W
;<<W X
}== 
return?? 
result?? 
;?? 
}@@ 	
publicBB 
OperationResultVoBB  
<BB  !#
UserConnectionViewModelBB! 8
>BB8 9
GetByIdBB: A
(BBA B
GuidBBB F
idBBG I
)BBI J
{CC 	
OperationResultVoDD 
<DD #
UserConnectionViewModelDD 5
>DD5 6
resultDD7 =
;DD= >
tryFF 
{GG 
UserConnectionHH 
modelHH $
=HH% &
thisHH' +
.HH+ ,'
userConnectionDomainServiceHH, G
.HHG H
GetByIdHHH O
(HHO P
idHHP R
)HHR S
;HHS T#
UserConnectionViewModelJJ '
vmJJ( *
=JJ+ ,
mapperJJ- 3
.JJ3 4
MapJJ4 7
<JJ7 8#
UserConnectionViewModelJJ8 O
>JJO P
(JJP Q
modelJJQ V
)JJV W
;JJW X
resultLL 
=LL 
newLL 
OperationResultVoLL .
<LL. /#
UserConnectionViewModelLL/ F
>LLF G
(LLG H
vmLLH J
)LLJ K
;LLK L
}MM 
catchNN 
(NN 
	ExceptionNN 
exNN 
)NN  
{OO 
resultPP 
=PP 
newPP 
OperationResultVoPP .
<PP. /#
UserConnectionViewModelPP/ F
>PPF G
(PPG H
exPPH J
.PPJ K
MessagePPK R
)PPR S
;PPS T
}QQ 
returnSS 
resultSS 
;SS 
}TT 	
publicVV 
OperationResultVoVV  
RemoveVV! '
(VV' (
GuidVV( ,
idVV- /
)VV/ 0
{WW 	
OperationResultVoXX 
resultXX $
;XX$ %
tryZZ 
{[[ 
this^^ 
.^^ '
userConnectionDomainService^^ 0
.^^0 1
Remove^^1 7
(^^7 8
id^^8 :
)^^: ;
;^^; <

unitOfWork`` 
.`` 
Commit`` !
(``! "
)``" #
;``# $
resultbb 
=bb 
newbb 
OperationResultVobb .
(bb. /
truebb/ 3
)bb3 4
;bb4 5
}cc 
catchdd 
(dd 
	Exceptiondd 
exdd 
)dd  
{ee 
resultff 
=ff 
newff 
OperationResultVoff .
(ff. /
exff/ 1
.ff1 2
Messageff2 9
)ff9 :
;ff: ;
}gg 
returnii 
resultii 
;ii 
}jj 	
publicll 
OperationResultVoll  
<ll  !
Guidll! %
>ll% &
Savell' +
(ll+ ,#
UserConnectionViewModelll, C
	viewModelllD M
)llM N
{mm 	
OperationResultVonn 
<nn 
Guidnn "
>nn" #
resultnn$ *
;nn* +
trypp 
{qq 
UserConnectionrr 
modelrr $
;rr$ %
UserConnectionvv 
existingvv '
=vv( )
thisvv* .
.vv. /'
userConnectionDomainServicevv/ J
.vvJ K
GetByIdvvK R
(vvR S
	viewModelvvS \
.vv\ ]
Idvv] _
)vv_ `
;vv` a
ifww 
(ww 
existingww 
!=ww 
nullww  $
)ww$ %
{xx 
modelyy 
=yy 
mapperyy "
.yy" #
Mapyy# &
(yy& '
	viewModelyy' 0
,yy0 1
existingyy2 :
)yy: ;
;yy; <
}zz 
else{{ 
{|| 
model}} 
=}} 
mapper}} "
.}}" #
Map}}# &
<}}& '
UserConnection}}' 5
>}}5 6
(}}6 7
	viewModel}}7 @
)}}@ A
;}}A B
}~~ 
if
�� 
(
�� 
	viewModel
�� 
.
�� 
Id
��  
==
��! #
Guid
��$ (
.
��( )
Empty
��) .
)
��. /
{
�� 
this
�� 
.
�� )
userConnectionDomainService
�� 4
.
��4 5
Add
��5 8
(
��8 9
model
��9 >
)
��> ?
;
��? @
	viewModel
�� 
.
�� 
Id
��  
=
��! "
model
��# (
.
��( )
Id
��) +
;
��+ ,
}
�� 
else
�� 
{
�� 
this
�� 
.
�� )
userConnectionDomainService
�� 4
.
��4 5
Update
��5 ;
(
��; <
model
��< A
)
��A B
;
��B C
}
�� 

unitOfWork
�� 
.
�� 
Commit
�� !
(
��! "
)
��" #
;
��# $
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
model
��5 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
ex
��5 7
.
��7 8
Message
��8 ?
)
��? @
;
��@ A
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� #
OperationResultListVo
�� $
<
��$ %%
UserConnectionViewModel
��% <
>
��< =
GetByTargetUserId
��> O
(
��O P
Guid
��P T
targetUserId
��U a
)
��a b
{
�� 	#
OperationResultListVo
�� !
<
��! "%
UserConnectionViewModel
��" 9
>
��9 :
result
��; A
;
��A B
try
�� 
{
�� 
IEnumerable
�� 
<
�� 
UserConnection
�� *
>
��* +
	allModels
��, 5
=
��6 7
this
��8 <
.
��< =)
userConnectionDomainService
��= X
.
��X Y
GetByTargetUserId
��Y j
(
��j k
targetUserId
��k w
)
��w x
;
��x y
IEnumerable
�� 
<
�� %
UserConnectionViewModel
�� 3
>
��3 4
vms
��5 8
=
��9 :
mapper
��; A
.
��A B
Map
��B E
<
��E F
IEnumerable
��F Q
<
��Q R
UserConnection
��R `
>
��` a
,
��a b
IEnumerable
��c n
<
��n o&
UserConnectionViewModel��o �
>��� �
>��� �
(��� �
	allModels��� �
)��� �
;��� �
result
�� 
=
�� 
new
�� #
OperationResultListVo
�� 2
<
��2 3%
UserConnectionViewModel
��3 J
>
��J K
(
��K L
vms
��L O
)
��O P
;
��P Q
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� #
OperationResultListVo
�� 2
<
��2 3%
UserConnectionViewModel
��3 J
>
��J K
(
��K L
ex
��L N
.
��N O
Message
��O V
)
��V W
;
��W X
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  
Connect
��! (
(
��( )
Guid
��) -
currentUserId
��. ;
,
��; <
Guid
��= A
userId
��B H
)
��H I
{
�� 	
try
�� 
{
�� 
Guid
�� 
newId
�� 
;
�� 
UserConnection
�� 
model
�� $
=
��% &
new
��' *
UserConnection
��+ 9
{
�� 
UserId
�� 
=
�� 
currentUserId
�� *
,
��* +
TargetUserId
��  
=
��! "
userId
��# )
}
�� 
;
�� 
UserConnection
�� 
existing
�� '
=
��( )
this
��* .
.
��. /)
userConnectionDomainService
��/ J
.
��J K
Get
��K N
(
��N O
currentUserId
��O \
,
��\ ]
userId
��^ d
)
��d e
;
��e f
if
�� 
(
�� 
existing
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
return
�� 
new
�� 
OperationResultVo
�� 0
(
��0 1
$str
��1 Z
)
��Z [
;
��[ \
}
�� 
else
�� 
{
�� 
this
�� 
.
�� )
userConnectionDomainService
�� 4
.
��4 5
Add
��5 8
(
��8 9
model
��9 >
)
��> ?
;
��? @
newId
�� 
=
�� 
model
�� !
.
��! "
Id
��" $
;
��$ %
}
�� 

unitOfWork
�� 
.
�� 
Commit
�� !
(
��! "
)
��" #
;
��# $
int
�� 
newCount
�� 
=
�� 
this
�� #
.
��# $)
userConnectionDomainService
��$ ?
.
��? @
Count
��@ E
(
��E F
x
��F G
=>
��H J
x
��K L
.
��L M
TargetUserId
��M Y
==
��Z \
userId
��] c
||
��d f
x
��g h
.
��h i
UserId
��i o
==
��p r
userId
��s y
&&
��z |
x
��} ~
.
��~ 
ApprovalDate�� �
.��� �
HasValue��� �
)��� �
;��� �
return
�� 
new
�� 
OperationResultVo
�� ,
<
��, -
int
��- 0
>
��0 1
(
��1 2
newCount
��2 :
)
��: ;
;
��; <
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
new
�� 
OperationResultVo
�� ,
(
��, -
ex
��- /
.
��/ 0
Message
��0 7
)
��7 8
;
��8 9
}
�� 
}
�� 	
public
�� 
OperationResultVo
��  

Disconnect
��! +
(
��+ ,
Guid
��, 0
currentUserId
��1 >
,
��> ?
Guid
��@ D
userId
��E K
)
��K L
{
�� 	
try
�� 
{
�� 
UserConnection
�� 
toMe
�� #
=
��$ %
this
��& *
.
��* +)
userConnectionDomainService
��+ F
.
��F G
Get
��G J
(
��J K
currentUserId
��K X
,
��X Y
userId
��Z `
)
��` a
;
��a b
UserConnection
�� 
fromMe
�� %
=
��& '
this
��( ,
.
��, -)
userConnectionDomainService
��- H
.
��H I
Get
��I L
(
��L M
userId
��M S
,
��S T
currentUserId
��U b
)
��b c
;
��c d
if
�� 
(
�� 
toMe
�� 
==
�� 
null
��  
&&
��! #
fromMe
��$ *
==
��+ -
null
��. 2
)
��2 3
{
�� 
return
�� 
new
�� 
OperationResultVo
�� 0
(
��0 1
$str
��1 V
)
��V W
;
��W X
}
�� 
else
�� 
{
�� 
if
�� 
(
�� 
toMe
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
this
�� 
.
�� )
userConnectionDomainService
�� 8
.
��8 9
Remove
��9 ?
(
��? @
toMe
��@ D
.
��D E
Id
��E G
)
��G H
;
��H I
}
�� 
if
�� 
(
�� 
fromMe
�� 
!=
�� !
null
��" &
)
��& '
{
�� 
this
�� 
.
�� )
userConnectionDomainService
�� 8
.
��8 9
Remove
��9 ?
(
��? @
fromMe
��@ F
.
��F G
Id
��G I
)
��I J
;
��J K
}
�� 
}
�� 

unitOfWork
�� 
.
�� 
Commit
�� !
(
��! "
)
��" #
;
��# $
int
�� 
newCount
�� 
=
�� 
this
�� #
.
��# $)
userConnectionDomainService
��$ ?
.
��? @
Count
��@ E
(
��E F
x
��F G
=>
��H J
x
��K L
.
��L M
TargetUserId
��M Y
==
��Z \
userId
��] c
)
��c d
;
��d e
return
�� 
new
�� 
OperationResultVo
�� ,
<
��, -
int
��- 0
>
��0 1
(
��1 2
newCount
��2 :
)
��: ;
;
��; <
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
new
�� 
OperationResultVo
�� ,
(
��, -
ex
��- /
.
��/ 0
Message
��0 7
)
��7 8
;
��8 9
}
�� 
}
�� 	
public
�� 
OperationResultVo
��  
Allow
��! &
(
��& '
Guid
��' +
currentUserId
��, 9
,
��9 :
Guid
��; ?
userId
��@ F
)
��F G
{
�� 	
OperationResultVo
�� 
result
�� $
;
��$ %
try
�� 
{
�� 
UserConnection
�� 
existing
�� '
=
��( )
this
��* .
.
��. /)
userConnectionDomainService
��/ J
.
��J K
Get
��K N
(
��N O
userId
��O U
,
��U V
currentUserId
��W d
)
��d e
;
��e f
if
�� 
(
�� 
existing
�� 
==
�� 
null
��  $
)
��$ %
{
�� 
result
�� 
=
�� 
new
��  
OperationResultVo
��! 2
(
��2 3
$str
��3 c
)
��c d
;
��d e
}
�� 
else
�� 
{
�� 
existing
�� 
.
�� 
ApprovalDate
�� )
=
��* +
DateTime
��, 4
.
��4 5
Now
��5 8
;
��8 9
this
�� 
.
�� )
userConnectionDomainService
�� 4
.
��4 5
Update
��5 ;
(
��; <
existing
��< D
)
��D E
;
��E F
}
�� 

unitOfWork
�� 
.
�� 
Commit
�� !
(
��! "
)
��" #
;
��# $
int
�� 
newCount
�� 
=
�� 
this
�� #
.
��# $)
userConnectionDomainService
��$ ?
.
��? @
Count
��@ E
(
��E F
x
��F G
=>
��H J
x
��K L
.
��L M
TargetUserId
��M Y
==
��Z \
userId
��] c
||
��d f
x
��g h
.
��h i
UserId
��i o
==
��p r
userId
��s y
&&
��z |
x
��} ~
.
��~ 
ApprovalDate�� �
.��� �
HasValue��� �
)��� �
;��� �
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
int
��/ 2
>
��2 3
(
��3 4
newCount
��4 <
)
��< =
;
��= >
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
(
��. /
ex
��/ 1
.
��1 2
Message
��2 9
)
��9 :
;
��: ;
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  
Deny
��! %
(
��% &
Guid
��& *
currentUserId
��+ 8
,
��8 9
Guid
��: >
userId
��? E
)
��E F
{
�� 	
OperationResultVo
�� 
result
�� $
;
��$ %
try
�� 
{
�� 
UserConnection
�� 
existing
�� '
=
��( )
this
��* .
.
��. /)
userConnectionDomainService
��/ J
.
��J K
Get
��K N
(
��N O
userId
��O U
,
��U V
currentUserId
��W d
)
��d e
;
��e f
if
�� 
(
�� 
existing
�� 
==
�� 
null
��  $
)
��$ %
{
�� 
result
�� 
=
�� 
new
��  
OperationResultVo
��! 2
(
��2 3
$str
��3 c
)
��c d
;
��d e
}
�� 
else
�� 
{
�� 
this
�� 
.
�� )
userConnectionDomainService
�� 4
.
��4 5
Remove
��5 ;
(
��; <
existing
��< D
.
��D E
Id
��E G
)
��G H
;
��H I
}
�� 

unitOfWork
�� 
.
�� 
Commit
�� !
(
��! "
)
��" #
;
��# $
int
�� 
newCount
�� 
=
�� 
this
�� #
.
��# $)
userConnectionDomainService
��$ ?
.
��? @
Count
��@ E
(
��E F
x
��F G
=>
��H J
x
��K L
.
��L M
TargetUserId
��M Y
==
��Z \
userId
��] c
||
��d f
x
��g h
.
��h i
UserId
��i o
==
��p r
userId
��s y
&&
��z |
x
��} ~
.
��~ 
ApprovalDate�� �
.��� �
HasValue��� �
)��� �
;��� �
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
int
��/ 2
>
��2 3
(
��3 4
newCount
��4 <
)
��< =
;
��= >
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
(
��. /
ex
��/ 1
.
��1 2
Message
��2 9
)
��9 :
;
��: ;
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
}
�� 
}�� ،
rC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Services\UserContentAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #
Services# +
{ 
public 

class !
UserContentAppService &
:' (
BaseAppService) 7
,7 8"
IUserContentAppService9 O
{ 
private 
readonly 
IMapper  
mapper! '
;' (
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
private 
readonly "
IUserContentRepository /

repository0 :
;: ;
private 
readonly &
IUserContentLikeRepository 3
likeRepository4 B
;B C
private 
readonly )
IUserContentCommentRepository 6
commentRepository7 H
;H I
private 
readonly &
IGamificationDomainService 3%
gamificationDomainService4 M
;M N
private 
readonly $
IGameFollowDomainService 1#
gameFollowDomainService2 I
;I J
public 
Guid 
CurrentUserId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public !
UserContentAppService $
($ %
IMapper% ,
mapper- 3
,3 4
IUnitOfWork5 @

unitOfWorkA K
,   "
IUserContentRepository   $

repository  % /
,!! &
IUserContentLikeRepository!! (
likeRepository!!) 7
,!!7 8)
IUserContentCommentRepository!!9 V
commentRepository!!W h
,"" &
IGamificationDomainService"" (%
gamificationDomainService"") B
,## $
IGameFollowDomainService## &#
gameFollowDomainService##' >
)##> ?
{$$ 	
this%% 
.%% 
mapper%% 
=%% 
mapper%%  
;%%  !
this&& 
.&& 

unitOfWork&& 
=&& 

unitOfWork&& (
;&&( )
this'' 
.'' 

repository'' 
='' 

repository'' (
;''( )
this(( 
.(( 
likeRepository(( 
=((  !
likeRepository((" 0
;((0 1
this)) 
.)) 
commentRepository)) "
=))# $
commentRepository))% 6
;))6 7
this** 
.** %
gamificationDomainService** *
=**+ ,%
gamificationDomainService**- F
;**F G
this++ 
.++ #
gameFollowDomainService++ (
=++) *#
gameFollowDomainService+++ B
;++B C
},, 	
public.. 
OperationResultVo..  
<..  !
int..! $
>..$ %
Count..& +
(..+ ,
).., -
{// 	
OperationResultVo00 
<00 
int00 !
>00! "
result00# )
;00) *
try22 
{33 
int44 
count44 
=44 

repository44 &
.44& '
GetAll44' -
(44- .
)44. /
.44/ 0
Count440 5
(445 6
)446 7
;447 8
result66 
=66 
new66 
OperationResultVo66 .
<66. /
int66/ 2
>662 3
(663 4
count664 9
)669 :
;66: ;
}77 
catch88 
(88 
	Exception88 
ex88 
)88  
{99 
result:: 
=:: 
new:: 
OperationResultVo:: .
<::. /
int::/ 2
>::2 3
(::3 4
ex::4 6
.::6 7
Message::7 >
)::> ?
;::? @
};; 
return== 
result== 
;== 
}>> 	
public@@ !
OperationResultListVo@@ $
<@@$ % 
UserContentViewModel@@% 9
>@@9 :
GetAll@@; A
(@@A B
)@@B C
{AA 	!
OperationResultListVoBB !
<BB! " 
UserContentViewModelBB" 6
>BB6 7
resultBB8 >
;BB> ?
tryDD 
{EE 

IQueryableFF 
<FF 
UserContentFF &
>FF& '
	allModelsFF( 1
=FF2 3

repositoryFF4 >
.FF> ?
GetAllFF? E
(FFE F
)FFF G
;FFG H
IEnumerableHH 
<HH  
UserContentViewModelHH 0
>HH0 1
vmsHH2 5
=HH6 7
mapperHH8 >
.HH> ?
MapHH? B
<HHB C
IEnumerableHHC N
<HHN O
UserContentHHO Z
>HHZ [
,HH[ \
IEnumerableHH] h
<HHh i 
UserContentViewModelHHi }
>HH} ~
>HH~ 
(	HH �
	allModels
HH� �
)
HH� �
;
HH� �
resultJJ 
=JJ 
newJJ !
OperationResultListVoJJ 2
<JJ2 3 
UserContentViewModelJJ3 G
>JJG H
(JJH I
vmsJJI L
)JJL M
;JJM N
}KK 
catchLL 
(LL 
	ExceptionLL 
exLL 
)LL  
{MM 
resultNN 
=NN 
newNN !
OperationResultListVoNN 2
<NN2 3 
UserContentViewModelNN3 G
>NNG H
(NNH I
exNNI K
.NNK L
MessageNNL S
)NNS T
;NNT U
}OO 
returnQQ 
resultQQ 
;QQ 
}RR 	
publicTT 
OperationResultVoTT  
<TT  ! 
UserContentViewModelTT! 5
>TT5 6
GetByIdTT7 >
(TT> ?
GuidTT? C
idTTD F
)TTF G
{UU 	
OperationResultVoVV 
<VV  
UserContentViewModelVV 2
>VV2 3
resultVV4 :
;VV: ;
tryXX 
{YY 
UserContentZZ 
modelZZ !
=ZZ" #

repositoryZZ$ .
.ZZ. /
GetByIdZZ/ 6
(ZZ6 7
idZZ7 9
)ZZ9 :
;ZZ: ; 
UserContentViewModel\\ $
vm\\% '
=\\( )
mapper\\* 0
.\\0 1
Map\\1 4
<\\4 5 
UserContentViewModel\\5 I
>\\I J
(\\J K
model\\K P
)\\P Q
;\\Q R
vm__ 
.__ 
Content__ 
=__ 
FormatContentToShow__ 0
(__0 1
vm__1 3
.__3 4
Content__4 ;
)__; <
;__< =
vmaa 
.aa 
UserContentTypeaa "
=aa# $
UserContentTypeaa% 4
.aa4 5
Postaa5 9
;aa9 :
vmcc 
.cc 
HasFeaturedImagecc #
=cc$ %
!cc& '
stringcc' -
.cc- .
IsNullOrWhiteSpacecc. @
(cc@ A
vmccA C
.ccC D
FeaturedImageccD Q
)ccQ R
&&ccS U
!ccV W
vmccW Y
.ccY Z
FeaturedImageccZ g
.ccg h
Containscch p
(ccp q
	Constantsccq z
.ccz {!
DefaultFeaturedImage	cc{ �
)
cc� �
;
cc� �
vmee 
.ee 
FeaturedMediaTypeee $
=ee% &
GetMediaTypeee' 3
(ee3 4
vmee4 6
.ee6 7
FeaturedImageee7 D
)eeD E
;eeE F
ifgg 
(gg 
vmgg 
.gg 
FeaturedMediaTypegg (
!=gg) +
	MediaTypegg, 5
.gg5 6
Youtubegg6 =
)gg= >
{hh 
vmii 
.ii 
FeaturedImageii $
=ii% &
SetFeaturedImageii' 7
(ii7 8
vmii8 :
.ii: ;
UserIdii; A
,iiA B
vmiiC E
.iiE F
FeaturedImageiiF S
)iiS T
;iiT U
}jj 
resultmm 
=mm 
newmm 
OperationResultVomm .
<mm. / 
UserContentViewModelmm/ C
>mmC D
(mmD E
vmmmE G
)mmG H
;mmH I
}nn 
catchoo 
(oo 
	Exceptionoo 
exoo 
)oo  
{pp 
resultqq 
=qq 
newqq 
OperationResultVoqq .
<qq. / 
UserContentViewModelqq/ C
>qqC D
(qqD E
exqqE G
.qqG H
MessageqqH O
)qqO P
;qqP Q
}rr 
returntt 
resulttt 
;tt 
}uu 	
publicww 
OperationResultVoww  
Removeww! '
(ww' (
Guidww( ,
idww- /
)ww/ 0
{xx 	
OperationResultVoyy 
resultyy $
;yy$ %
try{{ 
{|| 

repository 
. 
Remove !
(! "
id" $
)$ %
;% &

unitOfWork
�� 
.
�� 
Commit
�� !
(
��! "
)
��" #
;
��# $
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
(
��. /
true
��/ 3
)
��3 4
;
��4 5
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
(
��. /
ex
��/ 1
.
��1 2
Message
��2 9
)
��9 :
;
��: ;
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  
<
��  !
Guid
��! %
>
��% &
Save
��' +
(
��+ ,"
UserContentViewModel
��, @
	viewModel
��A J
)
��J K
{
�� 	
OperationResultVo
�� 
<
�� 
Guid
�� "
>
��" #
result
��$ *
;
��* +
try
�� 
{
�� 
UserContent
�� 
model
�� !
;
��! "
UserContent
�� 
latest
�� "
=
��# $

repository
��% /
.
��/ 0
GetAll
��0 6
(
��6 7
)
��7 8
.
��8 9
OrderBy
��9 @
(
��@ A
x
��A B
=>
��C E
x
��F G
.
��G H

CreateDate
��H R
)
��R S
.
��S T
Last
��T X
(
��X Y
)
��Y Z
;
��Z [
bool
�� 
sameContent
��  
=
��! "
latest
��# )
.
��) *
Content
��* 1
.
��1 2
Trim
��2 6
(
��6 7
)
��7 8
.
��8 9
ToLower
��9 @
(
��@ A
)
��A B
.
��B C
Replace
��C J
(
��J K
$str
��K N
,
��N O
string
��P V
.
��V W
Empty
��W \
)
��\ ]
.
��] ^
Equals
��^ d
(
��d e
	viewModel
��e n
.
��n o
Content
��o v
.
��v w
Trim
��w {
(
��{ |
)
��| }
.
��} ~
ToLower��~ �
(��� �
)��� �
.��� �
Replace��� �
(��� �
$str��� �
,��� �
string��� �
.��� �
Empty��� �
)��� �
)��� �
;��� �
bool
�� 
sameId
�� 
=
�� 
latest
�� $
.
��$ %
Id
��% '
==
��( *
	viewModel
��+ 4
.
��4 5
Id
��5 7
;
��7 8
if
�� 
(
�� 
sameContent
�� 
&&
��  "
!
��# $
sameId
��$ *
)
��* +
{
�� 
return
�� 
new
�� 
OperationResultVo
�� 0
<
��0 1
Guid
��1 5
>
��5 6
(
��6 7
$str
��7 t
)
��t u
;
��u v
}
�� 
string
�� 
youtubePattern
�� %
=
��& '
$str
��( \
;
��\ ]
	viewModel
�� 
.
�� 
Content
�� !
=
��" #
Regex
��$ )
.
��) *
Replace
��* 1
(
��1 2
	viewModel
��2 ;
.
��; <
Content
��< C
,
��C D
youtubePattern
��E S
,
��S T
delegate
��U ]
(
��^ _
Match
��_ d
match
��e j
)
��j k
{
�� 
string
�� 
v
�� 
=
�� 
match
�� $
.
��$ %
ToString
��% -
(
��- .
)
��. /
;
��/ 0
if
�� 
(
�� 
match
�� 
.
�� 
Index
�� #
==
��$ &
$num
��' (
&&
��) +
String
��, 2
.
��2 3 
IsNullOrWhiteSpace
��3 E
(
��E F
	viewModel
��F O
.
��O P
FeaturedImage
��P ]
)
��] ^
)
��^ _
{
�� 
	viewModel
�� !
.
��! "
FeaturedImage
��" /
=
��0 1
v
��2 3
;
��3 4
return
�� 
String
�� %
.
��% &
Empty
��& +
;
��+ ,
}
�� 
else
�� 
{
�� 
return
�� 
string
�� %
.
��% &
Format
��& ,
(
��, -
$str
��- G
,
��G H
v
��I J
)
��J K
;
��K L
}
�� 
}
�� 
)
�� 
;
�� 
UserContent
�� 
existing
�� $
=
��% &

repository
��' 1
.
��1 2
GetById
��2 9
(
��9 :
	viewModel
��: C
.
��C D
Id
��D F
)
��F G
;
��G H
if
�� 
(
�� 
existing
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
model
�� 
=
�� 
mapper
�� "
.
��" #
Map
��# &
(
��& '
	viewModel
��' 0
,
��0 1
existing
��2 :
)
��: ;
;
��; <
}
�� 
else
�� 
{
�� 
model
�� 
=
�� 
mapper
�� "
.
��" #
Map
��# &
<
��& '
UserContent
��' 2
>
��2 3
(
��3 4
	viewModel
��4 =
)
��= >
;
��> ?
PlatformAction
�� "
action
��# )
=
��* +
	viewModel
��, 5
.
��5 6
	IsComplex
��6 ?
?
��@ A
PlatformAction
��B P
.
��P Q
ComplexPost
��Q \
:
��] ^
PlatformAction
��_ m
.
��m n

SimplePost
��n x
;
��x y
this
�� 
.
�� '
gamificationDomainService
�� 2
.
��2 3
ProcessAction
��3 @
(
��@ A
	viewModel
��A J
.
��J K
UserId
��K Q
,
��Q R
action
��S Y
)
��Y Z
;
��Z [
}
�� 
if
�� 
(
�� 
	viewModel
�� 
.
�� 
Id
��  
==
��! #
Guid
��$ (
.
��( )
Empty
��) .
)
��. /
{
�� 

repository
�� 
.
�� 
Add
�� "
(
��" #
model
��# (
)
��( )
;
��) *
	viewModel
�� 
.
�� 
Id
��  
=
��! "
model
��# (
.
��( )
Id
��) +
;
��+ ,
}
�� 
else
�� 
{
�� 

repository
�� 
.
�� 
Update
�� %
(
��% &
model
��& +
)
��+ ,
;
��, -
}
�� 

unitOfWork
�� 
.
�� 
Commit
�� !
(
��! "
)
��" #
;
��# $
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
model
��5 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
ex
��5 7
.
��7 8
Message
��8 ?
)
��? @
;
��@ A
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
int
�� 
CountArticles
��  
(
��  !
)
��! "
{
�� 	
int
�� 
count
�� 
=
�� 

repository
�� "
.
��" #
Count
��# (
(
��( )
x
��) *
=>
��+ -
!
��. /
string
��/ 5
.
��5 6 
IsNullOrWhiteSpace
��6 H
(
��H I
x
��I J
.
��J K
Title
��K P
)
��P Q
&&
��R T
!
��U V
string
��V \
.
��\ ] 
IsNullOrWhiteSpace
��] o
(
��o p
x
��p q
.
��q r
Introduction
��r ~
)
��~ 
)�� �
;��� �
return
�� 
count
�� 
;
�� 
}
�� 	
public
�� 
IEnumerable
�� 
<
�� *
UserContentListItemViewModel
�� 7
>
��7 8
GetActivityFeed
��9 H
(
��H I
Guid
��I M
currentUserId
��N [
,
��[ \
int
��] `
count
��a f
,
��f g
Guid
��h l
gameId
��m s
,
��s t
Guid
��u y
userId��z �
,��� �
List��� �
<��� �!
SupportedLanguage��� �
>��� �
	languages��� �
)��� �
{
�� 	

IQueryable
�� 
<
�� 
UserContent
�� "
>
��" #
	allModels
��$ -
=
��. /

repository
��0 :
.
��: ;
GetAll
��; A
(
��A B
)
��B C
;
��C D
if
�� 
(
�� 
userId
�� 
!=
�� 
null
�� 
&&
�� !
userId
��" (
!=
��) +
Guid
��, 0
.
��0 1
Empty
��1 6
)
��6 7
{
�� 
	allModels
�� 
=
�� 
	allModels
�� %
.
��% &
Where
��& +
(
��+ ,
x
��, -
=>
��. 0
x
��1 2
.
��2 3
UserId
��3 9
!=
��: <
Guid
��= A
.
��A B
Empty
��B G
&&
��H J
x
��K L
.
��L M
UserId
��M S
==
��T V
userId
��W ]
)
��] ^
;
��^ _
}
�� 
if
�� 
(
�� 
gameId
�� 
!=
�� 
null
�� 
&&
�� !
gameId
��" (
!=
��) +
Guid
��, 0
.
��0 1
Empty
��1 6
)
��6 7
{
�� 
	allModels
�� 
=
�� 
	allModels
�� %
.
��% &
Where
��& +
(
��+ ,
x
��, -
=>
��. 0
x
��1 2
.
��2 3
GameId
��3 9
!=
��: <
Guid
��= A
.
��A B
Empty
��B G
&&
��H J
x
��K L
.
��L M
GameId
��M S
==
��T V
gameId
��W ]
)
��] ^
;
��^ _
}
�� 
if
�� 
(
�� 
	languages
�� 
!=
�� 
null
�� !
&&
��" $
	languages
��% .
.
��. /
Any
��/ 2
(
��2 3
)
��3 4
)
��4 5
{
�� 
	allModels
�� 
=
�� 
	allModels
�� %
.
��% &
Where
��& +
(
��+ ,
x
��, -
=>
��. 0
x
��1 2
.
��2 3
Language
��3 ;
==
��< >
$num
��? @
||
��A C
	languages
��D M
.
��M N
Contains
��N V
(
��V W
x
��W X
.
��X Y
Language
��Y a
)
��a b
)
��b c
;
��c d
}
�� 
IOrderedQueryable
�� 
<
�� 
UserContent
�� )
>
��) *
orderedList
��+ 6
=
��7 8
	allModels
��9 B
.
�� 
OrderByDescending
�� "
(
��" #
x
��# $
=>
��% '
x
��( )
.
��) *

CreateDate
��* 4
)
��4 5
;
��5 6

IQueryable
�� 
<
�� 
UserContent
�� "
>
��" #
	finalList
��$ -
=
��. /
orderedList
��0 ;
.
��; <
Take
��< @
(
��@ A
count
��A F
)
��F G
;
��G H
List
�� 
<
�� *
UserContentListItemViewModel
�� -
>
��- .

viewModels
��/ 9
=
��: ;
	finalList
��< E
.
��E F
	ProjectTo
��F O
<
��O P*
UserContentListItemViewModel
��P l
>
��l m
(
��m n
mapper
��n t
.
��t u$
ConfigurationProvider��u �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
foreach
�� 
(
�� *
UserContentListItemViewModel
�� 1
item
��2 6
in
��7 9

viewModels
��: D
)
��D E
{
�� 
item
�� 
.
�� 

AuthorName
�� 
=
��  !
string
��" (
.
��( ) 
IsNullOrWhiteSpace
��) ;
(
��; <
item
��< @
.
��@ A

AuthorName
��A K
)
��K L
?
��M N
$str
��O ]
:
��^ _
item
��` d
.
��d e

AuthorName
��e o
;
��o p
item
�� 
.
�� 
AuthorPicture
�� "
=
��# $
UrlFormatter
��% 1
.
��1 2
ProfileImage
��2 >
(
��> ?
item
��? C
.
��C D
UserId
��D J
)
��J K
;
��K L
item
�� 
.
�� 
	IsArticle
�� 
=
��  
!
��! "
string
��" (
.
��( ) 
IsNullOrWhiteSpace
��) ;
(
��; <
item
��< @
.
��@ A
Title
��A F
)
��F G
&&
��H J
!
��K L
string
��L R
.
��R S 
IsNullOrWhiteSpace
��S e
(
��e f
item
��f j
.
��j k
Introduction
��k w
)
��w x
;
��x y
item
�� 
.
�� 
HasFeaturedImage
�� %
=
��& '
!
��( )
string
��) /
.
��/ 0 
IsNullOrWhiteSpace
��0 B
(
��B C
item
��C G
.
��G H
FeaturedImage
��H U
)
��U V
&&
��W Y
!
��Z [
item
��[ _
.
��_ `
FeaturedImage
��` m
.
��m n
Contains
��n v
(
��v w
	Constants��w �
.��� �$
DefaultFeaturedImage��� �
)��� �
;��� �
item
�� 
.
�� 
FeaturedImageType
�� &
=
��' (
this
��) -
.
��- .
GetMediaType
��. :
(
��: ;
item
��; ?
.
��? @
FeaturedImage
��@ M
)
��M N
;
��N O
if
�� 
(
�� 
item
�� 
.
�� 
FeaturedImageType
�� *
!=
��+ -
	MediaType
��. 7
.
��7 8
Youtube
��8 ?
)
��? @
{
�� 
item
�� 
.
�� 
FeaturedImage
�� &
=
��' (
SetFeaturedImage
��) 9
(
��9 :
item
��: >
.
��> ?
UserId
��? E
,
��E F
item
��G K
.
��K L
FeaturedImage
��L Y
)
��Y Z
;
��Z [
}
�� 
item
�� 
.
�� 
	LikeCount
�� 
=
��  
likeRepository
��! /
.
��/ 0
GetAll
��0 6
(
��6 7
)
��7 8
.
��8 9
Count
��9 >
(
��> ?
x
��? @
=>
��A C
x
��D E
.
��E F
	ContentId
��F O
==
��P R
item
��S W
.
��W X
Id
��X Z
)
��Z [
;
��[ \
item
�� 
.
�� 
CommentCount
�� !
=
��" #
commentRepository
��$ 5
.
��5 6
GetAll
��6 <
(
��< =
)
��= >
.
��> ?
Count
��? D
(
��D E
x
��E F
=>
��G I
x
��J K
.
��K L
UserContentId
��L Y
==
��Z \
item
��] a
.
��a b
Id
��b d
)
��d e
;
��e f
if
�� 
(
�� 
currentUserId
�� !
!=
��" $
Guid
��% )
.
��) *
Empty
��* /
)
��/ 0
{
�� 
item
�� 
.
�� 
CurrentUserLiked
�� )
=
��* +
likeRepository
��, :
.
��: ;
GetAll
��; A
(
��A B
)
��B C
.
��C D
Any
��D G
(
��G H
x
��H I
=>
��J L
x
��M N
.
��N O
	ContentId
��O X
==
��Y [
item
��\ `
.
��` a
Id
��a c
&&
��d f
x
��g h
.
��h i
UserId
��i o
==
��p r
currentUserId��s �
)��� �
;��� �
IOrderedQueryable
�� %
<
��% & 
UserContentComment
��& 8
>
��8 9
comments
��: B
=
��C D
commentRepository
��E V
.
��V W
GetAll
��W ]
(
��] ^
)
��^ _
.
��_ `
Where
��` e
(
��e f
x
��f g
=>
��h j
x
��k l
.
��l m
UserContentId
��m z
==
��{ }
item��~ �
.��� �
Id��� �
)��� �
.��� �
OrderBy��� �
(��� �
x��� �
=>��� �
x��� �
.��� �

CreateDate��� �
)��� �
;��� �

IQueryable
�� 
<
�� )
UserContentCommentViewModel
�� :
>
��: ;

commentsVm
��< F
=
��G H
comments
��I Q
.
��Q R
	ProjectTo
��R [
<
��[ \)
UserContentCommentViewModel
��\ w
>
��w x
(
��x y
mapper
��y 
.�� �%
ConfigurationProvider��� �
)��� �
;��� �
item
�� 
.
�� 
Comments
�� !
=
��" #

commentsVm
��$ .
.
��. /
ToList
��/ 5
(
��5 6
)
��6 7
;
��7 8
foreach
�� 
(
�� )
UserContentCommentViewModel
�� 8
comment
��9 @
in
��A C
item
��D H
.
��H I
Comments
��I Q
)
��Q R
{
�� 
comment
�� 
.
��  

AuthorName
��  *
=
��+ ,
string
��- 3
.
��3 4 
IsNullOrWhiteSpace
��4 F
(
��F G
comment
��G N
.
��N O

AuthorName
��O Y
)
��Y Z
?
��[ \
$str
��] k
:
��l m
comment
��n u
.
��u v

AuthorName��v �
;��� �
comment
�� 
.
��  
AuthorPicture
��  -
=
��. /
UrlFormatter
��0 <
.
��< =
ProfileImage
��= I
(
��I J
comment
��J Q
.
��Q R
UserId
��R X
)
��X Y
;
��Y Z
comment
�� 
.
��  
Text
��  $
=
��% &
string
��' -
.
��- . 
IsNullOrWhiteSpace
��. @
(
��@ A
comment
��A H
.
��H I
Text
��I M
)
��M N
?
��O P
$str
��Q u
:
��v w
comment
��x 
.�� �
Text��� �
;��� �
}
�� 
}
�� 
item
�� 
.
�� 
Content
�� 
=
�� !
FormatContentToShow
�� 2
(
��2 3
item
��3 7
.
��7 8
Content
��8 ?
)
��? @
;
��@ A
item
�� 
.
�� 
UserContentType
�� $
=
��% &
UserContentType
��' 6
.
��6 7
Post
��7 ;
;
��; <
}
�� 
return
�� 

viewModels
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
string
�� 
SetFeaturedImage
�� .
(
��. /
Guid
��/ 3
userId
��4 :
,
��: ;
string
��< B
featuredImage
��C P
)
��P Q
{
�� 	
return
�� 
string
�� 
.
��  
IsNullOrWhiteSpace
�� ,
(
��, -
featuredImage
��- :
)
��: ;
||
��< >
featuredImage
��? L
.
��L M
Equals
��M S
(
��S T
	Constants
��T ]
.
��] ^"
DefaultFeaturedImage
��^ r
)
��r s
?
��t u
	Constants
��v 
.�� �$
DefaultFeaturedImage��� �
:��� �
UrlFormatter��� �
.��� �
Image��� �
(��� �
userId��� �
,��� �
BlobType��� �
.��� �
FeaturedImage��� �
,��� �
featuredImage��� �
)��� �
;��� �
}
�� 	
private
�� 
string
�� !
FormatContentToShow
�� *
(
��* +
string
��+ 1
content
��2 9
)
��9 :
{
�� 	
content
�� 
.
�� 
Replace
�� 
(
�� 
$str
�� -
,
��- .
$str
��/ Q
)
��Q R
;
��R S
string
�� 

patternUrl
�� 
=
�� 
$str��  �
;��� �
Regex
�� 

regexImage
�� 
=
�� 
new
�� "
Regex
��# (
(
��( )

patternUrl
��) 3
)
��3 4
;
��4 5
MatchCollection
�� 

matchesImg
�� &
=
��' (

regexImage
��) 3
.
��3 4
Matches
��4 ;
(
��; <
content
��< C
)
��C D
;
��D E
bool
�� 
ismatch
�� 
=
�� 

regexImage
�� %
.
��% &
IsMatch
��& -
(
��- .
content
��. 5
)
��5 6
;
��6 7
foreach
�� 
(
�� 
Match
�� 
match
��  
in
��! #

matchesImg
��$ .
)
��. /
{
�� 
string
�� 
	toReplace
��  
=
��! "
match
��# (
.
��( )
Groups
��) /
[
��/ 0
$num
��0 1
]
��1 2
.
��2 3
Value
��3 8
;
��8 9
string
�� 
	urlBefore
��  
=
��! "
match
��# (
.
��( )
Groups
��) /
[
��/ 0
$num
��0 1
]
��1 2
.
��2 3
Value
��3 8
;
��8 9
string
�� 
url
�� 
=
�� 
match
�� "
.
��" #
Groups
��# )
[
��) *
$num
��* +
]
��+ ,
.
��, -
Value
��- 2
;
��2 3
string
�� 
urlComplement
�� $
=
��% &
match
��' ,
.
��, -
Groups
��- 3
[
��3 4
$num
��4 5
]
��5 6
.
��6 7
Value
��7 <
;
��< =
string
�� 
urlAfter
�� 
=
��  !
match
��" '
.
��' (
Groups
��( .
[
��. /
$num
��/ 0
]
��0 1
.
��1 2
Value
��2 7
;
��7 8
url
�� 
=
�� 
!
�� 
	toReplace
��  
.
��  !
ToLower
��! (
(
��( )
)
��) *
.
��* +

StartsWith
��+ 5
(
��5 6
$str
��6 <
)
��< =
?
��> ?
String
��@ F
.
��F G
Format
��G M
(
��M N
$str
��N Z
,
��Z [
url
��\ _
)
��_ `
:
��a b
url
��c f
;
��f g
string
�� 
newText
�� 
=
��  
string
��! '
.
��' (
Empty
��( -
;
��- .
if
�� 
(
�� 
string
�� 
.
��  
IsNullOrWhiteSpace
�� -
(
��- .
	urlBefore
��. 7
)
��7 8
&&
��9 ;
string
��< B
.
��B C 
IsNullOrWhiteSpace
��C U
(
��U V
urlAfter
��V ^
)
��^ _
)
��_ `
{
�� 
newText
�� 
=
�� 
string
�� $
.
��$ %
Format
��% +
(
��+ ,
$str
��, r
,
��r s
url
��t w
)
��w x
;
��x y
}
�� 
else
�� 
{
�� 
newText
�� 
=
�� 
String
�� $
.
��$ %
Format
��% +
(
��+ ,
$str
��, A
,
��A B
url
��C F
)
��F G
;
��G H
}
�� 
content
�� 
=
�� 
content
�� !
.
��! "
Replace
��" )
(
��) *
	toReplace
��* 3
,
��3 4
newText
��5 <
)
��< =
;
��= >
}
�� 
return
�� 
content
�� 
;
�� 
}
�� 	
}
�� 
}�� �c
yC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Services\UserContentCommentAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #
Services# +
{ 
public 

class (
UserContentCommentAppService -
:. /)
IUserContentCommentAppService0 M
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly )
IUserContentCommentRepository 6
_repository7 B
;B C
public 
Guid 
CurrentUserId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public (
UserContentCommentAppService +
(+ ,
IMapper, 3
mapper4 :
,: ;
IUnitOfWork< G

unitOfWorkH R
,R S)
IUserContentCommentRepositoryT q

repositoryr |
)| }
{ 	
_mapper 
= 
mapper 
; 
_unitOfWork 
= 

unitOfWork $
;$ %
_repository 
= 

repository $
;$ %
} 	
public 
OperationResultVo  
<  !
int! $
>$ %
Count& +
(+ ,
), -
{ 	
OperationResultVo 
< 
int !
>! "
result# )
;) *
try!! 
{"" 
int## 
count## 
=## 
_repository## '
.##' (
GetAll##( .
(##. /
)##/ 0
.##0 1
Count##1 6
(##6 7
)##7 8
;##8 9
result%% 
=%% 
new%% 
OperationResultVo%% .
<%%. /
int%%/ 2
>%%2 3
(%%3 4
count%%4 9
)%%9 :
;%%: ;
}&& 
catch'' 
('' 
	Exception'' 
ex'' 
)''  
{(( 
result)) 
=)) 
new)) 
OperationResultVo)) .
<)). /
int))/ 2
>))2 3
())3 4
ex))4 6
.))6 7
Message))7 >
)))> ?
;))? @
}** 
return,, 
result,, 
;,, 
}-- 	
public// !
OperationResultListVo// $
<//$ %'
UserContentCommentViewModel//% @
>//@ A
GetAll//B H
(//H I
)//I J
{00 	!
OperationResultListVo11 !
<11! "'
UserContentCommentViewModel11" =
>11= >
result11? E
;11E F
try33 
{44 

IQueryable55 
<55 
UserContentComment55 -
>55- .
	allModels55/ 8
=559 :
_repository55; F
.55F G
GetAll55G M
(55M N
)55N O
;55O P
IEnumerable77 
<77 '
UserContentCommentViewModel77 7
>777 8
vms779 <
=77= >
_mapper77? F
.77F G
Map77G J
<77J K
IEnumerable77K V
<77V W
UserContentComment77W i
>77i j
,77j k
IEnumerable77l w
<77w x(
UserContentCommentViewModel	77x �
>
77� �
>
77� �
(
77� �
	allModels
77� �
)
77� �
;
77� �
result99 
=99 
new99 !
OperationResultListVo99 2
<992 3'
UserContentCommentViewModel993 N
>99N O
(99O P
vms99P S
)99S T
;99T U
}:: 
catch;; 
(;; 
	Exception;; 
ex;; 
);;  
{<< 
result== 
=== 
new== !
OperationResultListVo== 2
<==2 3'
UserContentCommentViewModel==3 N
>==N O
(==O P
ex==P R
.==R S
Message==S Z
)==Z [
;==[ \
}>> 
return@@ 
result@@ 
;@@ 
}AA 	
publicCC 
OperationResultVoCC  
<CC  !'
UserContentCommentViewModelCC! <
>CC< =
GetByIdCC> E
(CCE F
GuidCCF J
idCCK M
)CCM N
{DD 	
OperationResultVoEE 
<EE '
UserContentCommentViewModelEE 9
>EE9 :
resultEE; A
;EEA B
tryGG 
{HH 
UserContentCommentII "
modelII# (
=II) *
_repositoryII+ 6
.II6 7
GetByIdII7 >
(II> ?
idII? A
)IIA B
;IIB C'
UserContentCommentViewModelKK +
vmKK, .
=KK/ 0
_mapperKK1 8
.KK8 9
MapKK9 <
<KK< ='
UserContentCommentViewModelKK= X
>KKX Y
(KKY Z
modelKKZ _
)KK_ `
;KK` a
resultMM 
=MM 
newMM 
OperationResultVoMM .
<MM. /'
UserContentCommentViewModelMM/ J
>MMJ K
(MMK L
vmMML N
)MMN O
;MMO P
}NN 
catchOO 
(OO 
	ExceptionOO 
exOO 
)OO  
{PP 
resultQQ 
=QQ 
newQQ 
OperationResultVoQQ .
<QQ. /'
UserContentCommentViewModelQQ/ J
>QQJ K
(QQK L
exQQL N
.QQN O
MessageQQO V
)QQV W
;QQW X
}RR 
returnTT 
resultTT 
;TT 
}UU 	
publicWW 
OperationResultVoWW  
RemoveWW! '
(WW' (
GuidWW( ,
idWW- /
)WW/ 0
{XX 	
OperationResultVoYY 
resultYY $
;YY$ %
try[[ 
{\\ 
_repository__ 
.__ 
Remove__ "
(__" #
id__# %
)__% &
;__& '
_unitOfWorkaa 
.aa 
Commitaa "
(aa" #
)aa# $
;aa$ %
resultcc 
=cc 
newcc 
OperationResultVocc .
(cc. /
truecc/ 3
)cc3 4
;cc4 5
}dd 
catchee 
(ee 
	Exceptionee 
exee 
)ee  
{ff 
resultgg 
=gg 
newgg 
OperationResultVogg .
(gg. /
exgg/ 1
.gg1 2
Messagegg2 9
)gg9 :
;gg: ;
}hh 
returnjj 
resultjj 
;jj 
}kk 	
publicmm 
OperationResultVomm  
<mm  !
Guidmm! %
>mm% &
Savemm' +
(mm+ ,'
UserContentCommentViewModelmm, G
	viewModelmmH Q
)mmQ R
{nn 	
OperationResultVooo 
<oo 
Guidoo "
>oo" #
resultoo$ *
;oo* +
tryqq 
{rr 
UserContentCommentss "
modelss# (
;ss( )
UserContentCommentww "
existingww# +
=ww, -
_repositoryww. 9
.ww9 :
GetByIdww: A
(wwA B
	viewModelwwB K
.wwK L
IdwwL N
)wwN O
;wwO P
ifxx 
(xx 
existingxx 
!=xx 
nullxx  $
)xx$ %
{yy 
modelzz 
=zz 
_mapperzz #
.zz# $
Mapzz$ '
(zz' (
	viewModelzz( 1
,zz1 2
existingzz3 ;
)zz; <
;zz< =
}{{ 
else|| 
{}} 
model~~ 
=~~ 
_mapper~~ #
.~~# $
Map~~$ '
<~~' (
UserContentComment~~( :
>~~: ;
(~~; <
	viewModel~~< E
)~~E F
;~~F G
} 
if
�� 
(
�� 
	viewModel
�� 
.
�� 
Id
��  
==
��! #
Guid
��$ (
.
��( )
Empty
��) .
)
��. /
{
�� 
_repository
�� 
.
��  
Add
��  #
(
��# $
model
��$ )
)
��) *
;
��* +
	viewModel
�� 
.
�� 
Id
��  
=
��! "
model
��# (
.
��( )
Id
��) +
;
��+ ,
}
�� 
else
�� 
{
�� 
_repository
�� 
.
��  
Update
��  &
(
��& '
model
��' ,
)
��, -
;
��- .
}
�� 
_unitOfWork
�� 
.
�� 
Commit
�� "
(
��" #
)
��# $
;
��$ %
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
model
��5 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
ex
��5 7
.
��7 8
Message
��8 ?
)
��? @
;
��@ A
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
OperationResultVo
��  
Comment
��! (
(
��( ))
UserContentCommentViewModel
��) D
	viewModel
��E N
)
��N O
{
�� 	
OperationResultVo
�� 
response
�� &
;
��& '
bool
�� "
commentAlreadyExists
�� %
=
��& '
_repository
��( 3
.
��3 4
GetAll
��4 :
(
��: ;
)
��; <
.
��< =
Any
��= @
(
��@ A
x
��A B
=>
��C E
x
��F G
.
��G H
UserContentId
��H U
==
��V X
	viewModel
��Y b
.
��b c
UserContentId
��c p
&&
��q s
x
��t u
.
��u v
UserId
��v |
==
��} 
	viewModel��� �
.��� �
UserId��� �
&&��� �
x��� �
.��� �
Text��� �
.��� �
Equals��� �
(��� �
	viewModel��� �
.��� �
Text��� �
)��� �
)��� �
;��� �
if
�� 
(
�� "
commentAlreadyExists
�� $
)
��$ %
{
�� 
response
�� 
=
�� 
new
�� 
OperationResultVo
�� 0
(
��0 1
false
��1 6
)
��6 7
;
��7 8
response
�� 
.
�� 
Message
��  
=
��! "
$str
��# 7
;
��7 8
}
�� 
else
�� 
{
��  
UserContentComment
�� "
model
��# (
=
��) *
_mapper
��+ 2
.
��2 3
Map
��3 6
<
��6 7 
UserContentComment
��7 I
>
��I J
(
��J K
	viewModel
��K T
)
��T U
;
��U V
_repository
�� 
.
�� 
Add
�� 
(
��  
model
��  %
)
��% &
;
��& '
_unitOfWork
�� 
.
�� 
Commit
�� "
(
��" #
)
��# $
;
��$ %
int
�� 
newCount
�� 
=
�� 
_repository
�� *
.
��* +
GetAll
��+ 1
(
��1 2
)
��2 3
.
��3 4
Count
��4 9
(
��9 :
x
��: ;
=>
��< >
x
��? @
.
��@ A
UserContentId
��A N
==
��O Q
model
��R W
.
��W X
UserContentId
��X e
&&
��f h
x
��i j
.
��j k
UserId
��k q
==
��r t
model
��u z
.
��z {
UserId��{ �
)��� �
;��� �
response
�� 
=
�� 
new
�� 
OperationResultVo
�� 0
<
��0 1
int
��1 4
>
��4 5
(
��5 6
newCount
��6 >
)
��> ?
;
��? @
}
�� 
return
�� 
response
�� 
;
�� 
}
�� 	
}
�� 
}�� �m
qC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Services\UserFollowAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #
Services# +
{ 
public 

class  
UserFollowAppService %
:& '
BaseAppService( 6
,6 7!
IUserFollowAppService8 M
{ 
private 
readonly 
IMapper  
mapper! '
;' (
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
private 
readonly $
IUserFollowDomainService 1#
gameFollowDomainService2 I
;I J
public  
UserFollowAppService #
(# $
IMapper$ +
mapper, 2
,2 3
IUnitOfWork4 ?

unitOfWork@ J
, $
IUserFollowDomainService &#
gameFollowDomainService' >
)> ?
{ 	
this 
. 
mapper 
= 
mapper  
;  !
this 
. 

unitOfWork 
= 

unitOfWork (
;( )
this 
. #
gameFollowDomainService (
=) *#
gameFollowDomainService+ B
;B C
} 	
public 
Guid 
CurrentUserId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
OperationResultVo  
<  !
int! $
>$ %
Count& +
(+ ,
), -
{ 	
OperationResultVo 
< 
int !
>! "
result# )
;) *
try!! 
{"" 
int## 
count## 
=## #
gameFollowDomainService## 3
.##3 4
Count##4 9
(##9 :
)##: ;
;##; <
result%% 
=%% 
new%% 
OperationResultVo%% .
<%%. /
int%%/ 2
>%%2 3
(%%3 4
count%%4 9
)%%9 :
;%%: ;
}&& 
catch'' 
('' 
	Exception'' 
ex'' 
)''  
{(( 
result)) 
=)) 
new)) 
OperationResultVo)) .
<)). /
int))/ 2
>))2 3
())3 4
ex))4 6
.))6 7
Message))7 >
)))> ?
;))? @
}** 
return,, 
result,, 
;,, 
}-- 	
public// !
OperationResultListVo// $
<//$ %
UserFollowViewModel//% 8
>//8 9
GetAll//: @
(//@ A
)//A B
{00 	!
OperationResultListVo11 !
<11! "
UserFollowViewModel11" 5
>115 6
result117 =
;11= >
try33 
{44 
IEnumerable55 
<55 

UserFollow55 &
>55& '
	allModels55( 1
=552 3
this554 8
.558 9#
gameFollowDomainService559 P
.55P Q
GetAll55Q W
(55W X
)55X Y
;55Y Z
IEnumerable77 
<77 
UserFollowViewModel77 /
>77/ 0
vms771 4
=775 6
mapper777 =
.77= >
Map77> A
<77A B
IEnumerable77B M
<77M N

UserFollow77N X
>77X Y
,77Y Z
IEnumerable77[ f
<77f g
UserFollowViewModel77g z
>77z {
>77{ |
(77| }
	allModels	77} �
)
77� �
;
77� �
result99 
=99 
new99 !
OperationResultListVo99 2
<992 3
UserFollowViewModel993 F
>99F G
(99G H
vms99H K
)99K L
;99L M
}:: 
catch;; 
(;; 
	Exception;; 
ex;; 
);;  
{<< 
result== 
=== 
new== !
OperationResultListVo== 2
<==2 3
UserFollowViewModel==3 F
>==F G
(==G H
ex==H J
.==J K
Message==K R
)==R S
;==S T
}>> 
return@@ 
result@@ 
;@@ 
}AA 	
publicCC !
OperationResultListVoCC $
<CC$ %
UserFollowViewModelCC% 8
>CC8 9
GetByUserIdCC: E
(CCE F
GuidCCF J
userIdCCK Q
)CCQ R
{DD 	!
OperationResultListVoEE !
<EE! "
UserFollowViewModelEE" 5
>EE5 6
resultEE7 =
;EE= >
tryGG 
{HH 
IEnumerableII 
<II 

UserFollowII &
>II& '
	allModelsII( 1
=II2 3
thisII4 8
.II8 9#
gameFollowDomainServiceII9 P
.IIP Q
GetByUserIdIIQ \
(II\ ]
userIdII] c
)IIc d
;IId e
IEnumerableKK 
<KK 
UserFollowViewModelKK /
>KK/ 0
vmsKK1 4
=KK5 6
mapperKK7 =
.KK= >
MapKK> A
<KKA B
IEnumerableKKB M
<KKM N

UserFollowKKN X
>KKX Y
,KKY Z
IEnumerableKK[ f
<KKf g
UserFollowViewModelKKg z
>KKz {
>KK{ |
(KK| }
	allModels	KK} �
)
KK� �
;
KK� �
resultMM 
=MM 
newMM !
OperationResultListVoMM 2
<MM2 3
UserFollowViewModelMM3 F
>MMF G
(MMG H
vmsMMH K
)MMK L
;MML M
}NN 
catchOO 
(OO 
	ExceptionOO 
exOO 
)OO  
{PP 
resultQQ 
=QQ 
newQQ !
OperationResultListVoQQ 2
<QQ2 3
UserFollowViewModelQQ3 F
>QQF G
(QQG H
exQQH J
.QQJ K
MessageQQK R
)QQR S
;QQS T
}RR 
returnTT 
resultTT 
;TT 
}UU 	
publicWW 
OperationResultVoWW  
<WW  !
UserFollowViewModelWW! 4
>WW4 5
GetByIdWW6 =
(WW= >
GuidWW> B
idWWC E
)WWE F
{XX 	
OperationResultVoYY 
<YY 
UserFollowViewModelYY 1
>YY1 2
resultYY3 9
;YY9 :
try[[ 
{\\ 

UserFollow]] 
model]]  
=]]! "
this]]# '
.]]' (#
gameFollowDomainService]]( ?
.]]? @
GetById]]@ G
(]]G H
id]]H J
)]]J K
;]]K L
UserFollowViewModel__ #
vm__$ &
=__' (
mapper__) /
.__/ 0
Map__0 3
<__3 4
UserFollowViewModel__4 G
>__G H
(__H I
model__I N
)__N O
;__O P
resultaa 
=aa 
newaa 
OperationResultVoaa .
<aa. /
UserFollowViewModelaa/ B
>aaB C
(aaC D
vmaaD F
)aaF G
;aaG H
}bb 
catchcc 
(cc 
	Exceptioncc 
excc 
)cc  
{dd 
resultee 
=ee 
newee 
OperationResultVoee .
<ee. /
UserFollowViewModelee/ B
>eeB C
(eeC D
exeeD F
.eeF G
MessageeeG N
)eeN O
;eeO P
}ff 
returnhh 
resulthh 
;hh 
}ii 	
publickk 
OperationResultVokk  
Removekk! '
(kk' (
Guidkk( ,
idkk- /
)kk/ 0
{ll 	
OperationResultVomm 
resultmm $
;mm$ %
tryoo 
{pp 
thisss 
.ss #
gameFollowDomainServicess ,
.ss, -
Removess- 3
(ss3 4
idss4 6
)ss6 7
;ss7 8

unitOfWorkuu 
.uu 
Commituu !
(uu! "
)uu" #
;uu# $
resultww 
=ww 
newww 
OperationResultVoww .
(ww. /
trueww/ 3
)ww3 4
;ww4 5
}xx 
catchyy 
(yy 
	Exceptionyy 
exyy 
)yy  
{zz 
result{{ 
={{ 
new{{ 
OperationResultVo{{ .
({{. /
ex{{/ 1
.{{1 2
Message{{2 9
){{9 :
;{{: ;
}|| 
return~~ 
result~~ 
;~~ 
} 	
public
�� 
OperationResultVo
��  
<
��  !
Guid
��! %
>
��% &
Save
��' +
(
��+ ,!
UserFollowViewModel
��, ?
	viewModel
��@ I
)
��I J
{
�� 	
OperationResultVo
�� 
<
�� 
Guid
�� "
>
��" #
result
��$ *
;
��* +
try
�� 
{
�� 

UserFollow
�� 
model
��  
;
��  !

UserFollow
�� 
existing
�� #
=
��$ %
this
��& *
.
��* +%
gameFollowDomainService
��+ B
.
��B C
GetById
��C J
(
��J K
	viewModel
��K T
.
��T U
Id
��U W
)
��W X
;
��X Y
if
�� 
(
�� 
existing
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
model
�� 
=
�� 
mapper
�� "
.
��" #
Map
��# &
(
��& '
	viewModel
��' 0
,
��0 1
existing
��2 :
)
��: ;
;
��; <
}
�� 
else
�� 
{
�� 
model
�� 
=
�� 
mapper
�� "
.
��" #
Map
��# &
<
��& '

UserFollow
��' 1
>
��1 2
(
��2 3
	viewModel
��3 <
)
��< =
;
��= >
}
�� 
if
�� 
(
�� 
	viewModel
�� 
.
�� 
Id
��  
==
��! #
Guid
��$ (
.
��( )
Empty
��) .
)
��. /
{
�� 
this
�� 
.
�� %
gameFollowDomainService
�� 0
.
��0 1
Add
��1 4
(
��4 5
model
��5 :
)
��: ;
;
��; <
	viewModel
�� 
.
�� 
Id
��  
=
��! "
model
��# (
.
��( )
Id
��) +
;
��+ ,
}
�� 
else
�� 
{
�� 
this
�� 
.
�� %
gameFollowDomainService
�� 0
.
��0 1
Update
��1 7
(
��7 8
model
��8 =
)
��= >
;
��> ?
}
�� 

unitOfWork
�� 
.
�� 
Commit
�� !
(
��! "
)
��" #
;
��# $
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
model
��5 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
ex
��5 7
.
��7 8
Message
��8 ?
)
��? @
;
��@ A
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� #
OperationResultListVo
�� $
<
��$ %!
UserFollowViewModel
��% 8
>
��8 9
GetByFollowedId
��: I
(
��I J
Guid
��J N
followUserId
��O [
)
��[ \
{
�� 	#
OperationResultListVo
�� !
<
��! "!
UserFollowViewModel
��" 5
>
��5 6
result
��7 =
;
��= >
try
�� 
{
�� 
IEnumerable
�� 
<
�� 

UserFollow
�� &
>
��& '
	allModels
��( 1
=
��2 3
this
��4 8
.
��8 9%
gameFollowDomainService
��9 P
.
��P Q
Get
��Q T
(
��T U
x
��U V
=>
��W Y
x
��Z [
.
��[ \
FollowUserId
��\ h
==
��i k
followUserId
��l x
)
��x y
;
��y z
IEnumerable
�� 
<
�� !
UserFollowViewModel
�� /
>
��/ 0
vms
��1 4
=
��5 6
mapper
��7 =
.
��= >
Map
��> A
<
��A B
IEnumerable
��B M
<
��M N

UserFollow
��N X
>
��X Y
,
��Y Z
IEnumerable
��[ f
<
��f g!
UserFollowViewModel
��g z
>
��z {
>
��{ |
(
��| }
	allModels��} �
)��� �
;��� �
result
�� 
=
�� 
new
�� #
OperationResultListVo
�� 2
<
��2 3!
UserFollowViewModel
��3 F
>
��F G
(
��G H
vms
��H K
)
��K L
;
��L M
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� #
OperationResultListVo
�� 2
<
��2 3!
UserFollowViewModel
��3 F
>
��F G
(
��G H
ex
��H J
.
��J K
Message
��K R
)
��R S
;
��S T
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
}
�� 
}�� �X
vC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\Services\UserPreferencesAppService.cs
	namespace 	
IndieVisible
 
. 
Application "
." #
Services# +
{ 
public 

class %
UserPreferencesAppService *
:+ ,
BaseAppService- ;
,; <&
IUserPreferencesAppService= W
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly &
IUserPreferencesRepository 3
_repository4 ?
;? @
public 
Guid 
CurrentUserId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public %
UserPreferencesAppService (
(( )
IMapper) 0
mapper1 7
,7 8
IUnitOfWork9 D

unitOfWorkE O
,O P&
IUserPreferencesRepositoryQ k

repositoryl v
)v w
{ 	
_mapper 
= 
mapper 
; 
_unitOfWork 
= 

unitOfWork $
;$ %
_repository 
= 

repository $
;$ %
} 	
public 
OperationResultVo  
<  !
int! $
>$ %
Count& +
(+ ,
), -
{ 	
OperationResultVo 
< 
int !
>! "
result# )
;) *
try!! 
{"" 
int## 
count## 
=## 
_repository## '
.##' (
GetAll##( .
(##. /
)##/ 0
.##0 1
Count##1 6
(##6 7
)##7 8
;##8 9
result%% 
=%% 
new%% 
OperationResultVo%% .
<%%. /
int%%/ 2
>%%2 3
(%%3 4
count%%4 9
)%%9 :
;%%: ;
}&& 
catch'' 
('' 
	Exception'' 
ex'' 
)''  
{(( 
result)) 
=)) 
new)) 
OperationResultVo)) .
<)). /
int))/ 2
>))2 3
())3 4
ex))4 6
.))6 7
Message))7 >
)))> ?
;))? @
}** 
return,, 
result,, 
;,, 
}-- 	
public// !
OperationResultListVo// $
<//$ %$
UserPreferencesViewModel//% =
>//= >
GetAll//? E
(//E F
)//F G
{00 	!
OperationResultListVo11 !
<11! "$
UserPreferencesViewModel11" :
>11: ;
result11< B
;11B C
try33 
{44 

IQueryable55 
<55 
UserPreferences55 *
>55* +
	allModels55, 5
=556 7
_repository558 C
.55C D
GetAll55D J
(55J K
)55K L
;55L M
IEnumerable77 
<77 $
UserPreferencesViewModel77 4
>774 5
vms776 9
=77: ;
_mapper77< C
.77C D
Map77D G
<77G H
IEnumerable77H S
<77S T
UserPreferences77T c
>77c d
,77d e
IEnumerable77f q
<77q r%
UserPreferencesViewModel	77r �
>
77� �
>
77� �
(
77� �
	allModels
77� �
)
77� �
;
77� �
result99 
=99 
new99 !
OperationResultListVo99 2
<992 3$
UserPreferencesViewModel993 K
>99K L
(99L M
vms99M P
)99P Q
;99Q R
}:: 
catch;; 
(;; 
	Exception;; 
ex;; 
);;  
{<< 
result== 
=== 
new== !
OperationResultListVo== 2
<==2 3$
UserPreferencesViewModel==3 K
>==K L
(==L M
ex==M O
.==O P
Message==P W
)==W X
;==X Y
}>> 
return@@ 
result@@ 
;@@ 
}AA 	
publicCC 
OperationResultVoCC  
<CC  !$
UserPreferencesViewModelCC! 9
>CC9 :
GetByIdCC; B
(CCB C
GuidCCC G
idCCH J
)CCJ K
{DD 	
OperationResultVoEE 
<EE $
UserPreferencesViewModelEE 6
>EE6 7
resultEE8 >
;EE> ?
tryGG 
{HH 
UserPreferencesII 
modelII  %
=II& '
_repositoryII( 3
.II3 4
GetByIdII4 ;
(II; <
idII< >
)II> ?
;II? @$
UserPreferencesViewModelKK (
vmKK) +
=KK, -
_mapperKK. 5
.KK5 6
MapKK6 9
<KK9 :$
UserPreferencesViewModelKK: R
>KKR S
(KKS T
modelKKT Y
)KKY Z
;KKZ [
resultMM 
=MM 
newMM 
OperationResultVoMM .
<MM. /$
UserPreferencesViewModelMM/ G
>MMG H
(MMH I
vmMMI K
)MMK L
;MML M
}NN 
catchOO 
(OO 
	ExceptionOO 
exOO 
)OO  
{PP 
resultQQ 
=QQ 
newQQ 
OperationResultVoQQ .
<QQ. /$
UserPreferencesViewModelQQ/ G
>QQG H
(QQH I
exQQI K
.QQK L
MessageQQL S
)QQS T
;QQT U
}RR 
returnTT 
resultTT 
;TT 
}UU 	
publicWW $
UserPreferencesViewModelWW '
GetByUserIdWW( 3
(WW3 4
GuidWW4 8
userIdWW9 ?
)WW? @
{XX 	
UserPreferencesYY 
modelYY !
=YY" #
_repositoryYY$ /
.YY/ 0
GetAllYY0 6
(YY6 7
)YY7 8
.YY8 9
FirstOrDefaultYY9 G
(YYG H
xYYH I
=>YYJ L
xYYM N
.YYN O
UserIdYYO U
==YYV X
userIdYYY _
)YY_ `
;YY` a
if[[ 
([[ 
model[[ 
==[[ 
null[[ 
)[[ 
{\\ 
model]] 
=]] 
new]] 
UserPreferences]] +
(]]+ ,
)]], -
;]]- .
model^^ 
.^^ 
UserId^^ 
=^^ 
userId^^ %
;^^% &
}__ $
UserPreferencesViewModelaa $
vmaa% '
=aa( )
_mapperaa* 1
.aa1 2
Mapaa2 5
<aa5 6$
UserPreferencesViewModelaa6 N
>aaN O
(aaO P
modelaaP U
)aaU V
;aaV W
returncc 
vmcc 
;cc 
}dd 	
publicff 
OperationResultVoff  
Removeff! '
(ff' (
Guidff( ,
idff- /
)ff/ 0
{gg 	
OperationResultVohh 
resulthh $
;hh$ %
tryjj 
{kk 
_repositorynn 
.nn 
Removenn "
(nn" #
idnn# %
)nn% &
;nn& '
_unitOfWorkpp 
.pp 
Commitpp "
(pp" #
)pp# $
;pp$ %
resultrr 
=rr 
newrr 
OperationResultVorr .
(rr. /
truerr/ 3
)rr3 4
;rr4 5
}ss 
catchtt 
(tt 
	Exceptiontt 
extt 
)tt  
{uu 
resultvv 
=vv 
newvv 
OperationResultVovv .
(vv. /
exvv/ 1
.vv1 2
Messagevv2 9
)vv9 :
;vv: ;
}ww 
returnyy 
resultyy 
;yy 
}zz 	
public|| 
OperationResultVo||  
<||  !
Guid||! %
>||% &
Save||' +
(||+ ,$
UserPreferencesViewModel||, D
	viewModel||E N
)||N O
{}} 	
OperationResultVo~~ 
<~~ 
Guid~~ "
>~~" #
result~~$ *
;~~* +
try
�� 
{
�� 
UserPreferences
�� 
model
��  %
;
��% &
if
�� 
(
�� 
	viewModel
�� 
.
�� 
Id
��  
==
��! #
	viewModel
��$ -
.
��- .
UserId
��. 4
)
��4 5
{
�� 
	viewModel
�� 
.
�� 
Id
��  
=
��! "
Guid
��# '
.
��' (
Empty
��( -
;
��- .
}
�� 
UserPreferences
�� 
existing
��  (
=
��) *
_repository
��+ 6
.
��6 7
GetById
��7 >
(
��> ?
	viewModel
��? H
.
��H I
Id
��I K
)
��K L
;
��L M
if
�� 
(
�� 
existing
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
model
�� 
=
�� 
_mapper
�� #
.
��# $
Map
��$ '
(
��' (
	viewModel
��( 1
,
��1 2
existing
��3 ;
)
��; <
;
��< =
}
�� 
else
�� 
{
�� 
model
�� 
=
�� 
_mapper
�� #
.
��# $
Map
��$ '
<
��' (
UserPreferences
��( 7
>
��7 8
(
��8 9
	viewModel
��9 B
)
��B C
;
��C D
}
�� 
if
�� 
(
�� 
	viewModel
�� 
.
�� 
Id
��  
==
��! #
Guid
��$ (
.
��( )
Empty
��) .
)
��. /
{
�� 
_repository
�� 
.
��  
Add
��  #
(
��# $
model
��$ )
)
��) *
;
��* +
	viewModel
�� 
.
�� 
Id
��  
=
��! "
model
��# (
.
��( )
Id
��) +
;
��+ ,
}
�� 
else
�� 
{
�� 
_repository
�� 
.
��  
Update
��  &
(
��& '
model
��' ,
)
��, -
;
��- .
}
�� 
_unitOfWork
�� 
.
�� 
Commit
�� "
(
��" #
)
��# $
;
��$ %
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
model
��5 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
=
�� 
new
�� 
OperationResultVo
�� .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
ex
��5 7
.
��7 8
Message
��8 ?
)
��? @
;
��@ A
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
}
�� 
}�� �
lC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\BaseViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
{ 
public 

abstract 
class 
BaseViewModel '
{ 
public		 
Guid		 
Id		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
public 
Guid 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
public 
DateTime 

CreateDate "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
bool 
CurrentUserLiked $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
bool  
CurrentUserFollowing (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
PermissionsVo 
Permissions (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
BaseViewModel 
( 
) 
{ 	
Permissions 
= 
new 
PermissionsVo +
(+ ,
), -
;- .
} 	
} 
} �	
�C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\Brainstorm\BrainstormCommentViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .

Brainstorm. 8
{ 
public 

class &
BrainstormCommentViewModel +
:, -
BaseViewModel. ;
{ 
public		 
Guid		 
?		 
ParentCommentId		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
public 
Guid 
IdeaId 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 

AuthorName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
AuthorPicture #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Text 
{ 
get  
;  !
set" %
;% &
}' (
} 
} �
�C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\Brainstorm\BrainstormIdeaViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .

Brainstorm. 8
{ 
public 

class #
BrainstormIdeaViewModel (
:) *-
!UserGeneratedCommentBaseViewModel+ L
<L M&
BrainstormCommentViewModelM g
>g h
{ 
public		 
Guid		 
	SessionId		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
[ 	
Required	 
] 
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
	VoteCount 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
CommentCount 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
Score 
{ 
get 
; 
internal  (
set) ,
;, -
}. /
public 
	VoteValue 
CurrentUserVote (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} �	
�C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\Brainstorm\BrainstormSessionViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .

Brainstorm. 8
{ 
public		 

class		 &
BrainstormSessionViewModel		 +
:		, -
BaseViewModel		. ;
{

 
[ 	
Required	 
] 
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public !
BrainstormSessionType $
Type% )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
Guid 
? 
TargetContextId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} �
�C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\Brainstorm\BrainstormVoteViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .

Brainstorm. 8
{ 
public 

class #
BrainstormVoteViewModel (
:) *
BaseViewModel+ 8
{		 
public

 
Guid

 
VotingItemId

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
public 
	VoteValue 
	VoteValue "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} �
�C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\Content\UserContentCommentViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .
Content. 5
{ 
public 

class '
UserContentCommentViewModel ,
:- .&
UserGeneratedBaseViewModel/ I
{		 
public

 
Guid

 
ParentCommentId

 #
{

$ %
get

& )
;

) *
set

+ .
;

. /
}

0 1
public 
Guid 
UserContentId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Text 
{ 
get  
;  !
set" %
;% &
}' (
} 
} �
�C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\Content\UserContentListItemViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .
Content. 5
{ 
public 

class (
UserContentListItemViewModel -
:. /-
!UserGeneratedCommentBaseViewModel0 Q
<Q R'
UserContentCommentViewModelR m
>m n
{ 
public 
string 
FeaturedImage #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public

 
string

 
Title

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
Introduction "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
Content 
{ 
get  #
;# $
set% (
;( )
}* +
public 
SupportedLanguage  
Language! )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
int 
	LikeCount 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
CommentCount 
{  !
get" %
;% &
set' *
;* +
}, -
public 
bool 
CurrentUserLiked $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
Guid 
GameId 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
GameName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
bool 
	IsArticle 
{ 
get  #
;# $
set% (
;( )
}* +
public 
bool 
HasFeaturedImage $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public   
	MediaType   
FeaturedImageType   *
{  + ,
get  - 0
;  0 1
set  2 5
;  5 6
}  7 8
}!! 
}"" �
�C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\Content\UserContentToBeFeaturedViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .
Content. 5
{ 
public		 

class		 ,
 UserContentToBeFeaturedViewModel		 1
:		2 3&
UserGeneratedBaseViewModel		4 N
{

 
public 
string 
FeaturedImage #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Introduction "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
Content 
{ 
get  #
;# $
set% (
;( )
}* +
public 
SupportedLanguage  
Language! )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
int 
	LikeCount 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
CommentCount 
{  !
get" %
;% &
set' *
;* +
}, -
public 
bool 
CurrentUserLiked $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
Guid 
GameId 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
GameName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
bool 
	IsArticle 
{ 
get  #
;# $
set% (
;( )
}* +
public   
bool   
TitleCompliant   "
{  # $
get  % (
;  ( )
set  * -
;  - .
}  / 0
public"" 
bool"" 
IntroCompliant"" "
{""# $
get""% (
;""( )
set""* -
;""- .
}""/ 0
public## 
bool## 
ContentCompliant## $
{##% &
get##' *
;##* +
internal##, 4
set##5 8
;##8 9
}##: ;
public$$ 
bool$$ 

IsFeatured$$ 
{$$  
get$$! $
;$$$ %
internal$$& .
set$$/ 2
;$$2 3
}$$4 5
public%% 
Guid%% 
?%% 
CurrentFeatureId%% %
{%%& '
get%%( +
;%%+ ,
internal%%- 5
set%%6 9
;%%9 :
}%%; <
}&& 
}'' �!
{C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\Content\UserContentViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .
Content. 5
{ 
public 

class  
UserContentViewModel %
:& '&
UserGeneratedBaseViewModel( B
{		 
[ 	
Display	 
( 
Name 
= 
$str (
)( )
]) *
public 
string 
FeaturedImage #
{$ %
get& )
;) *
set+ .
;. /
}0 1
[ 	
Display	 
( 
Name 
= 
$str  
)  !
]! "
public 
List 
< 
string 
> 
Images "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
StringLength	 
( 
$num 
) 
] 
[ 	
Display	 
( 
Name 
= 
$str 
)  
]  !
[ 	
Required	 
( 
ErrorMessage 
=  
$str! 8
)8 9
]9 :
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Display	 
( 
Name 
= 
$str &
)& '
]' (
[ 	
Required	 
( 
ErrorMessage 
=  
$str! ?
)? @
]@ A
public 
string 
Introduction "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
Display	 
( 
Name 
= 
$str !
)! "
]" #
[ 	
Required	 
( 
ErrorMessage 
=  
$str! :
): ;
]; <
public 
string 
Content 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Display	 
( 
Name 
= 
$str "
)" #
]# $
public 
SupportedLanguage  
Language! )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[   	
Display  	 
(   
Name   
=   
$str   &
)  & '
]  ' (
public!! 
Guid!! 
?!! 
GameId!! 
{!! 
get!! !
;!!! "
set!!# &
;!!& '
}!!( )
public"" 
string"" 
	GameTitle"" 
{""  !
get""" %
;""% &
set""' *
;""* +
}"", -
public## 
string## 
GameThumbnail## #
{##$ %
get##& )
;##) *
set##+ .
;##. /
}##0 1
public%% 
bool%% 
HasFeaturedImage%% $
{%%% &
get%%' *
;%%* +
set%%, /
;%%/ 0
}%%1 2
public&& 
	MediaType&& 
FeaturedMediaType&& *
{&&+ ,
get&&- 0
;&&0 1
set&&2 5
;&&5 6
}&&7 8
public(( 
bool(( 
	IsComplex(( 
{(( 
get((  #
{(($ %
return((& ,
!((- .
string((. 4
.((4 5
IsNullOrWhiteSpace((5 G
(((G H
this((H L
.((L M
Title((M R
)((R S
&&((T V
!((W X
string((X ^
.((^ _
IsNullOrWhiteSpace((_ q
(((q r
this((r v
.((v w
FeaturedImage	((w �
)
((� �
;
((� �
}
((� �
}
((� �
})) 
}** �
�C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\FeaturedContent\FeaturedContentViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .
FeaturedContent. =
{ 
public 

class $
FeaturedContentViewModel )
:* +
BaseViewModel, 9
{ 
public		 
bool		 
Active		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public 
Guid 
UserContentId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Introduction "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DateTime 
	StartDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
EndDate 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Url 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
ImageUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} �
wC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\Game\GameFollowViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .
Game. 2
{ 
public 

class 
GameFollowViewModel $
:% &
BaseViewModel' 4
{ 
public		 
Guid		 
GameId		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
}

 
} �%
yC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\Game\GameListItemViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .
Game. 2
{		 
public

 

class

 !
GameListItemViewModel

 &
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
Guid 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
ThumbnailUrl "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
DeveloperImageUrl '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
DeveloperName #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Price 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
	Platforms 
{  !
get" %
;% &
set' *
;* +
}, -
private 
List 
< 
string 
> 
_platformList *
;* +
public 
List 
< 
string 
> 
PlatformList (
{ 	
get   
{!! 
if"" 
("" 
_platformList"" !
==""" $
null""% )
||""* ,
!""- .
_platformList"". ;
.""; <
Any""< ?
(""? @
)""@ A
)""A B
{## 
_platformList$$ !
=$$" #
PopulatePlatforms$$$ 5
($$5 6
)$$6 7
;$$7 8
}%% 
return'' 
_platformList'' $
;''$ %
}(( 
})) 	
public++ !
GameListItemViewModel++ $
(++$ %
)++% &
{,, 	
}-- 	
private// 
List// 
<// 
string// 
>// 
PopulatePlatforms// .
(//. /
)/// 0
{00 	
List11 
<11 
string11 
>11 
platformList11 %
=11& '
new11( +
List11, 0
<110 1
string111 7
>117 8
(118 9
)119 :
;11: ;
if33 
(33 
!33 
string33 
.33 
IsNullOrWhiteSpace33 *
(33* +
this33+ /
.33/ 0
	Platforms330 9
)339 :
)33: ;
{44 
string55 
[55 
]55 
values55 
=55  !
this55" &
.55& '
	Platforms55' 0
.550 1
Split551 6
(556 7
$char557 :
)55: ;
;55; <
values77 
.77 
Where77 
(77 
x77 
=>77 !
!77" #
string77# )
.77) *
IsNullOrWhiteSpace77* <
(77< =
x77= >
)77> ?
)77? @
.77@ A
ToList77A G
(77G H
)77H I
.77I J
ForEach77J Q
(77Q R
x77R S
=>77T V
{88 
GamePlatforms99 !
parsedValue99" -
;99- .
bool;; 
convertionOK;; %
=;;& '
Enum;;( ,
.;;, -
TryParse;;- 5
<;;5 6
GamePlatforms;;6 C
>;;C D
(;;D E
x;;E F
,;;F G
out;;H K
parsedValue;;L W
);;W X
;;;X Y
if== 
(== 
convertionOK== $
)==$ %
{>> 
string?? 
uiClass?? &
=??' (
parsedValue??) 4
.??4 5
GetAttributeOfType??5 G
<??G H
UiInfoAttribute??H W
>??W X
(??X Y
)??Y Z
.??Z [
Class??[ `
;??` a
platformListAA $
.AA$ %
AddAA% (
(AA( )
uiClassAA) 0
)AA0 1
;AA1 2
}BB 
}CC 
)CC 
;CC 
}DD 
returnFF 
platformListFF 
;FF  
}GG 	
}HH 
}II �)
qC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\Game\GameViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .
Game. 2
{ 
public 

class 
GameViewModel 
:  &
UserGeneratedBaseViewModel! ;
{		 
[

 	
Required

	 
(

 
ErrorMessage

 
=

  
$str

! 8
)

8 9
]

9 :
[ 	
	MinLength	 
( 
$num 
) 
] 
[ 	
	MaxLength	 
( 
$num 
) 
] 
[ 	
Display	 
( 
Name 
= 
$str 
)  
]  !
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Display	 
( 
Name 
= 
$str 
) 
] 
public 
string 
Url 
{ 
get 
;  
set! $
;$ %
}& '
[ 	
Display	 
( 
Name 
= 
$str 
)  
]  !
public 
	GameGenre 
Genre 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Display	 
( 
Name 
= 
$str %
)% &
]& '
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
Display	 
( 
Name 
= 
$str %
)% &
]& '
public 
string 
CoverImageUrl #
{$ %
get& )
;) *
set+ .
;. /
}0 1
[ 	
Display	 
( 
Name 
= 
$str #
)# $
]$ %
public 
string 
ThumbnailUrl "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
Display	 
( 
Name 
= 
$str  
)  !
]! "
public   

GameEngine   
Engine    
{  ! "
get  # &
;  & '
set  ( +
;  + ,
}  - .
["" 	
Display""	 
("" 
Name"" 
="" 
$str"" '
)""' (
]""( )
public## 
CodeLanguage## 
Language## $
{##% &
get##' *
;##* +
set##, /
;##/ 0
}##1 2
[%% 	
Display%%	 
(%% 
Name%% 
=%% 
$str%% !
)%%! "
]%%" #
public&& 
string&& 

WebsiteUrl&&  
{&&! "
get&&# &
;&&& '
set&&( +
;&&+ ,
}&&- .
[(( 	
Display((	 
((( 
Name(( 
=(( 
$str((  
)((  !
]((! "
public)) 

GameStatus)) 
Status))  
{))! "
get))# &
;))& '
set))( +
;))+ ,
}))- .
[++ 	
Display++	 
(++ 
Name++ 
=++ 
$str++ &
)++& '
]++' (
public,, 
DateTime,, 
?,, 
ReleaseDate,, $
{,,% &
get,,' *
;,,* +
set,,, /
;,,/ 0
},,1 2
[.. 	
Display..	 
(.. 
Name.. 
=.. 
$str.. #
)..# $
]..$ %
public// 
List// 
<// 
GamePlatforms// !
>//! "
	Platforms//# ,
{//- .
get/// 2
;//2 3
set//4 7
;//7 8
}//9 :
public33 
string33 
FacebookUrl33 !
{33" #
get33$ '
;33' (
set33) ,
;33, -
}33. /
public55 
string55 

TwitterUrl55  
{55! "
get55# &
;55& '
set55( +
;55+ ,
}55- .
public77 
string77 
InstagramUrl77 "
{77# $
get77% (
;77( )
set77* -
;77- .
}77/ 0
public;; 
int;; 
FollowerCount;;  
{;;! "
get;;# &
;;;& '
set;;( +
;;;+ ,
};;- .
public<< 
int<< 
CommentCount<< 
{<<  !
get<<" %
;<<% &
set<<' *
;<<* +
}<<, -
public== 
int== 
	LikeCount== 
{== 
get== "
;==" #
set==$ '
;==' (
}==) *
}?? 
}@@ �
~C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\Gamification\UserBadgeViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .
Gamification. :
{ 
public 

class 
UserBadgeViewModel #
:$ %
BaseViewModel& 3
{		 
public

 
	BadgeType

 
Badge

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
} 
} �
uC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\Home\CarouselViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .
Home. 2
{ 
public		 

class		 
CarouselViewModel		 "
{

 
public 
List 
< $
FeaturedContentViewModel ,
>, -
Items. 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
} 
} �
uC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\Home\CountersViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .
Home. 2
{ 
public 

class 
CountersViewModel "
{		 
public

 
int

 

GamesCount

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
int 

UsersCount 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
ArticlesCount  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
	JamsCount 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} �

�C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\Notification\NotificationItemViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .
Notification. :
{ 
public 

class %
NotificationItemViewModel *
:+ ,
BaseViewModel- :
{		 
public

 
string

 
Text

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
Url 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Icon 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
	IconColor 
{  !
get" %
;% &
set' *
;* +
}, -
public 
bool 
IsRead 
{ 
get  
;  !
set" %
;% &
}' (
public 
NotificationType 
Type  $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} �
yC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\UserGeneratedBaseViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
{ 
public		 

abstract		 
class		 &
UserGeneratedBaseViewModel		 4
:		5 6
BaseViewModel		7 D
{

 
[ 	
Display	 
( 
Name 
= 
$str (
)( )
]) *
public 
string 
AuthorPicture #
{$ %
get& )
;) *
set+ .
;. /
}0 1
[ 	
Display	 
( 
Name 
= 
$str %
)% &
]& '
public 
string 

AuthorName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
UserContentType 
UserContentType .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public &
UserGeneratedBaseViewModel )
() *
)* +
:, -
base. 2
(2 3
)3 4
{ 	
} 	
} 
public 

abstract 
class -
!UserGeneratedCommentBaseViewModel ;
<; <
TComment< D
>D E
:F G&
UserGeneratedBaseViewModelH b
{ 
public 
List 
< 
TComment 
> 
Comments &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public -
!UserGeneratedCommentBaseViewModel 0
(0 1
)1 2
:3 4
base5 9
(9 :
): ;
{ 	
Comments 
= 
new 
List 
<  
TComment  (
>( )
() *
)* +
;+ ,
} 	
}   
}## �
yC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\UserLike\UserLikeViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .
UserLike. 6
{ 
public 

class 
UserLikeViewModel "
:# $
BaseViewModel% 2
{		 
public

 
Guid

 
LikedId

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
LikeTargetType 

TargetType (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} �
�C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\UserPreferences\UserPreferencesViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .
UserPreferences. =
{ 
public		 

class		 $
UserPreferencesViewModel		 )
:		* +
BaseViewModel		, 9
{

 
[ 	
Display	 
( 
Name 
= 
$str %
)% &
]& '
public 
SupportedLanguage  

UiLanguage! +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
[ 	
Display	 
( 
Name 
= 
$str *
)* +
]+ ,
public 
string 
ContentLanguages &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[ 	
Display	 
( 
Name 
= 
$str *
)* +
]+ ,
public 
List 
< 
SupportedLanguage %
>% &
	Languages' 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
} 
} �H
tC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\User\ProfileViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .
User. 2
{ 
public 

class 
ProfileViewModel !
:! "
BaseViewModel# 0
{		 
public

 
ProfileType

 
Type

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
[ 	
Display	 
( 
Name 
= 
$str $
)$ %
]% &
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Motto 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
ProfileImageUrl %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
CoverImageUrl #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Bio 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 

StudioName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Location 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
bool 
HasOtherProfiles $
{% &
get' *
{   
return!! 
!!! 
string!! 
.!! 
IsNullOrWhiteSpace!! 1
(!!1 2
GameJoltUrl!!2 =
)!!= >
||"" 
!"" 
string"" 
."" 
IsNullOrWhiteSpace"" 1
(""1 2
	ItchIoUrl""2 ;
)""; <
||## 
!## 
string## 
.## 
IsNullOrWhiteSpace## 1
(##1 2

IndieDbUrl##2 <
)##< =
||$$ 
!$$ 
string$$ 
.$$ 
IsNullOrWhiteSpace$$ 1
($$1 2
GameDevNetUrl$$2 ?
)$$? @
||%% 
!%% 
string%% 
.%% 
IsNullOrWhiteSpace%% 1
(%%1 2
UnityConnectUrl%%2 A
)%%A B
;%%B C
}&& 
}'' 	
[(( 	
Display((	 
((( 
Name(( 
=(( 
$str(( !
)((! "
]((" #
public)) 
string)) 
GameJoltUrl)) !
{))" #
get))$ '
;))' (
set))) ,
;)), -
})). /
[++ 	
Display++	 
(++ 
Name++ 
=++ 
$str++ !
)++! "
]++" #
public,, 
string,, 
	ItchIoUrl,, 
{,,  !
get,," %
;,,% &
set,,' *
;,,* +
},,, -
[.. 	
Display..	 
(.. 
Name.. 
=.. 
$str.. !
)..! "
].." #
public// 
string// 

IndieDbUrl//  
{//! "
get//# &
;//& '
set//( +
;//+ ,
}//- .
[11 	
Display11	 
(11 
Name11 
=11 
$str11 %
)11% &
]11& '
public22 
string22 
GameDevNetUrl22 #
{22$ %
get22& )
;22) *
set22+ .
;22. /
}220 1
[44 	
Display44	 
(44 
Name44 
=44 
$str44 '
)44' (
]44( )
public55 
string55 
UnityConnectUrl55 %
{55& '
get55( +
;55+ ,
set55- 0
;550 1
}552 3
public:: 
UserCounters:: 
Counters:: $
{::% &
get::' *
;::* +
set::, /
;::/ 0
}::1 2
public<< 
IndieXpCounter<< 
IndieXp<< %
{<<& '
get<<( +
;<<+ ,
set<<- 0
;<<0 1
}<<2 3
public>> 

Dictionary>> 
<>> 
ExternalLinks>> '
,>>' (
string>>) /
>>>/ 0
ExternalLinks>>1 >
{>>? @
get>>A D
;>>D E
set>>F I
;>>I J
}>>K L
public@@ &
ConnectionControlViewModel@@ )
ConnectionControl@@* ;
{@@< =
get@@> A
;@@A B
set@@C F
;@@F G
}@@H I
publicBB 
ProfileViewModelBB 
(BB  
)BB  !
{CC 	
CountersDD 
=DD 
newDD 
UserCountersDD '
(DD' (
)DD( )
;DD) *
IndieXpEE 
=EE 
newEE 
IndieXpCounterEE (
(EE( )
)EE) *
;EE* +
ExternalLinksFF 
=FF 
newFF 

DictionaryFF  *
<FF* +
ExternalLinksFF+ 8
,FF8 9
stringFF: @
>FF@ A
(FFA B
)FFB C
;FFC D
ConnectionControlGG 
=GG 
newGG  #&
ConnectionControlViewModelGG$ >
(GG> ?
)GG? @
;GG@ A
}HH 	
}II 
publicKK 

classKK 
IndieXpCounterKK 
{LL 
publicMM 
intMM 
LevelMM 
{MM 
getMM 
;MM 
setMM  #
;MM# $
}MM% &
publicOO 
intOO 
LevelXpOO 
{OO 
getOO  
;OO  !
setOO" %
;OO% &
}OO' (
publicQQ 
intQQ 
NextLevelXpQQ 
{QQ  
getQQ! $
;QQ$ %
setQQ& )
;QQ) *
}QQ+ ,
publicSS 
intSS 
XpToNextLevelSS  
{TT 	
getUU 
{VV 
returnWW 
NextLevelXpWW "
-WW# $
LevelXpWW% ,
;WW, -
}XX 
}YY 	
public[[ 
int[[ !
PercentageToNextLevel[[ (
{\\ 	
get]] 
{^^ 
int__ 

percentage__ 
=__  
(__! "
int__" %
)__% &
Math__& *
.__* +
Round__+ 0
(__0 1
(__1 2
double__2 8
)__8 9
(__9 :
$num__: =
*__> ?
LevelXp__@ G
)__G H
/__I J
NextLevelXp__K V
)__V W
;__W X
returnaa 

percentageaa !
;aa! "
}bb 
}cc 	
publicee 
stringee 
	LevelNameee 
{ee  !
getee" %
;ee% &
setee' *
;ee* +
}ee, -
}ff 
publichh 

classhh 
UserCountershh 
{ii 
publicjj 
intjj 
	Followersjj 
{jj 
getjj "
;jj" #
setjj$ '
;jj' (
}jj) *
publicll 
intll 
	Followingll 
{ll 
getll "
;ll" #
setll$ '
;ll' (
}ll) *
publicnn 
intnn 
Connectionsnn 
{nn  
getnn! $
;nn$ %
setnn& )
;nn) *
}nn+ ,
publicpp 
intpp 
Gamespp 
{pp 
getpp 
;pp 
setpp  #
;pp# $
}pp% &
publicrr 
intrr 
Postsrr 
{rr 
getrr 
;rr 
setrr  #
;rr# $
}rr% &
publictt 
inttt 
Commentstt 
{tt 
gettt !
;tt! "
settt# &
;tt& '
}tt( )
publicvv 
intvv 
Jamsvv 
{vv 
getvv 
;vv 
setvv "
;vv" #
}vv$ %
}ww 
publicyy 

classyy &
ConnectionControlViewModelyy +
{zz 
public{{ 
bool{{ 
ConnectionIsPending{{ '
{{{( )
get{{* -
;{{- .
set{{/ 2
;{{2 3
}{{4 5
public}} 
bool}}  
CurrentUserConnected}} (
{}}) *
get}}+ .
;}}. /
set}}0 3
;}}3 4
}}}5 6
public 
bool &
CurrentUserWantsToFollowMe .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
}
�� 
}�� �
{C:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\User\UserConnectionViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .
User. 2
{ 
public 

class #
UserConnectionViewModel (
:) *
BaseViewModel+ 8
{ 
public		 
Guid		 
TargetUserId		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
}

 
} �
wC:\Users\daniel.gomes.ext\Documents\GitHub\indievisible\IndieVisible.Application\ViewModels\User\UserFollowViewModel.cs
	namespace 	
IndieVisible
 
. 
Application "
." #

ViewModels# -
.- .
User. 2
{ 
public 

class 
UserFollowViewModel $
:% &
BaseViewModel' 4
{ 
public 
Guid 
FollowUserId  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
}		 