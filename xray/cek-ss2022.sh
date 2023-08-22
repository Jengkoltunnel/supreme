#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��!�dcek-ss2022.sh �ZyTS�ֿ	B�
�8����F/-*8#c�($ā*F�(�X���ZKk��"�Pkp��
��T�
y��{7|���}k}��
������}�}�p����Y,BW��IⲬ(ޛ��d�*�y��0ޘ�י.c�Sn��.��;�>�>e1�1a����SB�a�a��B�2��?G�D�F��i��F=���^�4s
E���۱i�fڮ�K�V����?��_)�����T�>*��Ht��nOg��Ч:��`gB����9�?C�b�֧�qw����9"F,Q$�H�;b��x��(��֝>+�}~�1[��O\:]��o�CkgB�s�����H֛1nn�d���f#���R'���WT��Ŗ���۳1����&���G� �1�cj1���p?�x�|�|�<� �� �h��R����	p;x�\` �f �n w5��1���o��ыؐ���o����Gꩄ��G�7���N8�/-���(Q,'��db�<�	�K#<=C��#�$Q�\+"�E�8q$/�E*∈��i�bD"V/���H&�HC@&K1G�)�"I��V��)ԇ�xy$�QDB�J&�����@"�B�Ē��&��� �`!���/��Cb���$A,���D���t?�)!�\Ƶ_��~9�ŝ��!����r�,p��D#�J�c��A��QE�����?���+c���#���-P�{Bc;��e�ꩧyEo�����ϳ�q��'YC'܍�˽�qw2EM輪+�ܔ���o`�=x3g&Y�|�0�2*x_�z��5e�%8�0p63�0p�}��0p���8���܌�/0p_���1�Pn���ܒ��1p>Od�f?3p+�����)���`��ܚ9^܆��0p[�����x�Et���U�JW���T����?\�2�H��V��R��v���1��N5���W�GO��Z��>��֪���W�i_S��+�G��\̗ m�����G<�R5Y���h+�l��qģ�����׈G[�&�_!m�� �oG<�B5ޘ߂x�uj�0��h��8b~��-�F�y��֩!0��h��4�!>��~�/B�n?�� �;n?�g �n?�}o�ۏy�ADe��{d���r)�zL*k�39�;�i1���2��3ؼ�;L���RD8��l���p�����L[�w؀�HS�O���k�F����X=�d]&+���P�m���:
���o�Z���A���z:%U�rs2�k�z�������?�c_��_��A`s����E�q& M㌉���8S�&E�s66pEfC7�C�i�\�R��8-R��dS��<+�"��T%�U�2]�&U�f�u��U�\��)��kcA��	\��%�&VE'��� ���)�FUAFT@e�$��N �M�}����UHu�����"�����g]��;°��:AM�d��nV�^{�,~
��d����&�� �L�!����@��Pm�+����=q�%}P���$}p�R�'ѵ�IG�Rb��Z�k���j��Xf��2�N���&ԥ�s\���Ӣ�Ū+H�& ��f�2��E5w8���/�Xh��+��܉���9U�*SgB�H)Z��CKY��@
Z��h��jQ�a"�W���0Gq՘f�%�ta�*�C��R�أ� �e9\zP�w�D����,�[p�V��\���fR�h�㠦rIeR3!w�s-/��kOa��A�5�p1U	V�V�{���Xu�*�U/y񠶨�Eg�d�r�:��TU�.C�������Q��'�ܡ��bl^ȥ��,���N����]fX����]��nA��. ���mS��P�e"yz�k2��9�*}'j���T��pA�?[�~�;�o�{_�O��Tl�1�Y��6�AN�to�2���4(��
h�J�Y��L�n��fq���%�I헣�d�Y���P!)QU������IMz��¾� �E.ԕ��TJ�t�P`,�!0��wo�����|����E�{O�	�_@�zF���#�m�[�X�B���hP)@�em5����U7il �c4JN� � x)���]Ɉ�dS�2�1h
�.��G��C�$�ֈl0|
x�3�ql`K��0f |h[:�Td�Z�O�(�?��k�jau���|���AnC���P�t�X�T� Ѽ��}�,���3ݯ	�B9�B9��Qs�����-�����
+T�w��8Qx��p����é^���aw)�F��ꂁo�&Bm� :�F�������W�@�@#��o�0��p��v�9ȹ8��:	$��֩�u���5���L>zgP�Hw��[�t�$��T��\(i8H���}Dx�x]@/^�k?V�v\�]\[���H�*\���R�U�.V�׷��� �*�-?�K8��\�� �z�h8�@F$`�A�
ȉ��'���������6e6���O��Q�A̬�9��[�$��)aM݄ta6��3�%3����?܃�a����?���� �"��߿Fi��(=+�������2�@�YJQM��2��U����vG{��˔E\z/�a>}�Δ���,9�ϯ !�.-�>�/��6x�S�֙�g:BJ;tJfL Ȟ�j��	T��@+���T�f��!´�1�mU`��ג�T��g	�-��h���S���z��j��;n�
��Ad�D���E�HꛍМ�V#���|�_��_�v�ꥏ��!���"=�P<G�N��}���,�	'��(�+�~]�H��p&��AT��K�t���¢�~':�$^N1
G�H�"ND!�(���D2�0Yt�b�`G�T�80�q�T�"ޅ�(Q���F1ޑp�G���y��h�&�]s�K���[��V��Cx =���Ò�JH�n�W�z 
�?�7p�4h.�1��V � ���0�~�~z �����v@����wά5sV��eon��b�
���
YZ�0F|\� ��k��h�Z
�Y���w[��@L�=a���u���`�����.A����8�X
R�S,L؋�%_?!�_��_����w��W/�����(Ձ�LO^�.�m��!z�E�����,���) y���X�2�}�9��9�S@~И!*��vc%�����_b�1=�Hi��)���:���&�lc-��	-3����38��[�	i�4�n��������r��������Zr�8\�z6@=�N�sk H\е��JW�*]��t���U���Ӣ;�;��<O��9���8���>d�;[�;?fO�g��4՝#��I��M+�<}XLw�j0}hJwvʛ���@����>����tj_�4o���t5����tg�tgͪ��x��~�45��=��&��|.m��y]�6м���м���Н+�\���`M��4��	4M��.���9�^�iM���-MM��e�4u��X�N��<�F�4�J?^ݹ���zT��5ZNZ?1���z�u����w��^��S�N%���k����}�ݏY~Hyz}���NՊ{������5�e�+�X�u0:��~�/;�O[τ�C�����ƌK3Lv�-�=��[��0��%9�G_=Z8�:�i�������5f��QN�,Nj.��O�g�[X�e���{n�}�b�UC�^r�0)n㛃�N��˻ܷ{i�:����wV�L$n�k${�#<�=�>�|��P����,��⚚�O�����|�)'ͳ��1;�ë���+�/�|>�w�S^�īJVs"tY�k�!�8��)�ɷ_�u���������:�Dy���u�c�*�"�p��<�2y�:��̔+��k/�w��'����Dy����d�h���/r�4}�h_�)G/��xqu��i	y�uu�i�U}Fy��_��{�Ճrḳ=23��q\�o�Ɂ�zgč����Ģr�m��[���d�����r�����\\'��1鿧ǫq���]��b�C^N�#q+&�O���6@�i���S2U4~d���ik��<�m�۪'������Ӛo��zNrX�:0���CN�T�<4����m���-���>�i��������=��.ݽ��f��^f�rl���jYQ�w�Q���k���s�߮X�b�r����F�����9�:0d���+��8y��d�ˑ?h��G��=6��/��m�����/���Y3����_9��p��Q�~��N�ʈ��*��?�|�y^�]4j��w��HҬ��M�$�q��Vp��3���ޖ&m�U|F�r��?�})9p���,n����B^�iz�L�vs|˒n���猣�Mo��Ű~)��̓�}�%/���8>ۙ���
�U1N���������Z�u�oe<��l������̘��ܪ�����M��jQ}�U��AkJ��l��k�6ln���{�Y���^������)ʞ��%��\qַ����^�u���ꮖN��}���y��ȣek�'V�~}xmt�Lk�o��dA3s��N�a�?luث7�qg���̾0tٍ͖��jݾ��S�z�������T9a+Kn�h\8!����n���G����ޤ���"]�g�ː���~�6`{�CC�o;��'��Rx��,�����ǲ����j�E��rJ>�2<㏢�6n���s�����cN�*=������^
a��*�O�S��ꖰ������m�wN9]��fb��[�+E�&�<c�3ݷ$��m���{�q�W_r�0�x܋��3\o�}R�3:�����/���h�u�����o���o����6"x�����3|W_�g_;b{���u�xc2��T���K�x��_
�{ۏKO|���;̝���_�~�V&8Ye^���㳤㍮��_< �mسL���&?��������������D{sR�u^�"~k�=h]��nK�Y.�~^�C�60@;x[�#W����n��x����Gs�ؕ��lc_��'�+'���ݟ�iO/t�u:1�����ﲝǜ{�|�����J{�(M�u[��e۶m��m۶mw�6�l�vU���]�z{�z����ď��y�9���ל�7�;��f�N�HNկ�0�Eu+Z�_Nfı�~,��9�JH��a�^b�x��O�TO^��y�@�5^Ԁ�c�*[��&�x{P@�J_�o&l
�����k�Qr<�䎁�#�u�p�ف�t)F^9��m���*˵�#�~XėO���Ȣ��a��$�O�l��{}�y�0���/T������ܡ)S�$g2aV�`�D߀��u�	�l��S/��k��í��t'§�.h�/F[��\AlRr��U�oS��>0~qPo���Bs8�ȁ�2�#S�Pv<��&lR�]��x��n������T����s.MG^tt �C�-	�3��U��T�B�b����Spؒ^�W������a~=�����c�3QWj�:�����]��_�K�m�������V�R��?8�c�}묳��_K7+��м?2ZϯW�g4�_����V��z�$�2�Ts�QH�T'�$'Q<g�[�D�2°�E�k`��bj���A��X�*%Y�D��bS�Q�:���~{C���S�Ĉ&�,{�޵OQX\�N������	�V�KC��ԑ�pHY=���$�l|*��R ��DNrqv�l��F@6��P��u�"��A�� �f�
��yXc7�@f�&���2����	V�Ev�0*��5M��^�P{f2�g#��JNTɻ%�
�b��;jo�s��r�����W�?[�4 wCr�hV��	:���Wӎ�LX���N�UG�`Y0P�[���Q����`~I�"�8�mĿ���lcb�>L߮��&����k%
7~�9^�3�Rc�������(#cP�����h"m� #y�[z���u��I��j�^�*���XNb%�1sH_�ȖD�,^/������#�bVP��~ �L�����b�K)����xlC!%	j8�ɋ4�Į\P���yR'�i����>FWE,�çAf�2*�$��~�$Q�lJ��<.ȅ��[�Ze���ǯ� ��\��]�vb�&�UkW�"]� kMe��yq�4p�L]�Ը�q7�#��j$�*�ǻ��g6�[�zL�<p��bE��;H���P���w==9�?��gT��,��/�r�E!HQrK����X<�X��U]-�������gF�3�����J�ņ�9o�l|��Pޒ-�����h1���j����n�WF���\NDkeqgϯ?��O�\-�ڑ�(CK?+��H��%�� aM���p����O����nQ2��G!^�o]\|6��{TdB�q!Ks����8�s�qCg��$Z��o�}P"�� ����@t����f�믡��������
�N����V�����m3�1�$�sS=�ɓ���1*�ya��<k�G�w�[������a vɁ��m�|� 59J�lt؟
@���^�R����_	�Z��tQ4�2�
yU\�0w$��Hhd2�d�l&���*�����;.SF=J'���(����^(/tE�$̇0��@|�h�qtQd6VM�j�z�R,�'�,�ֳ�w� �m���_Mx��Q���ۜu�nw��jZ��^cN+�:a�.&������	�����#ի{C.�p>�rJ���7�5\��T�25��%i�%K�ىK|�Sg���q�#�,�̸�����MF툏��Z,)��M�E���c]���"*���']���O��mU%+�GH\��TO����B�~����f�b����\�Ӑ_4�b�n�x"�2ױ��E@y��J?�j"����TS�ro����t���6��s���C�R�J:<M�(����Am[�$�Q�di�S|�x�@9��o��v=�[O&��D4����'�����_,����ߦ���7�k�}&�'u�(59A�Vz+���&C��o::@�y(QP_���8��8'����`0�l� ���5�=/��yb�����lÞ\�m�^�ptU���	߮ݫ(�_�����MMj�������'(0�7֏M1��	�*j8/�����u��Ab� U̾��s4�������l�bB��	���{�fbP�fW���HWE]��<z��{Cxm��B����F���0ۤ�S)��EC�y�Tb�}����vAǼ�a ���NZ �s���;��>�����f�j�0"�(�w��ԃ+�����>27��G/\Ѝ!�`/J��#]�H�P�=~O���X�Q �$8�"wy��9�J�B҆��/GN�4Ar�=.>Կ<5��s����ÿxV@��O!����u+�\�vh�?����1Ӟ��$��Q,�a\Y�e]yo��!L�89z�.�8]�~$�7)�h�W��Q���+�ٙsӲ���{.F�ҍv~�`={)K-%K|�²��r6��VUEu���X_f,o��IԮ_���Sާ�k�f����^,���~�zA�rP~H��ه'�Ah?�|���2�Ss��)#D��k����.���J{�w��*;�R��[�1�~6�|�?(L����&��m����KbU5N
V�!�k<$��Xp��c�̼�q�4%�P5���NmTsH\\2+��jp�a���CI#MQen5���/�q��ۃ����I�0͘���8+�#�&|�� י�k�;=�R��~)��h�М�ZE�}����Ǫj��M�l�P:��
P�~!��4�ǝ�vbN�
-9唈{[e����S@a1m�N(9��aZ ��b�IRO7�D��m-��q�r�_������ըh1�?r�D���LeO��C��s� �]Ol�X]3���7Z��fkH���)�mk\]Qy���q&x���i; ��N�w'("��G�|���Y#P-F�գ�J�6��ΨE#��}(�b��O2;v�拜h�ᩮ|R%������sj��/�/7T"L����z@�58��_)Q�i��)�A���J��ԞA�fP�����j���/�׃��X�����TZ���A�Jͭhq��5�l���(�4��$�`�����xZ_V8�S�Xs� ��~TE�u�;z��N�r���������{4�7{!���:t[�6��[�t^��b�QtFsǻ�qbAh����� �����(���;��x!�`��Wd��D}�?�!��z�a+����R��� �
4�Q�#��`6��>
�M�J�-��:&�xU=�C
��u�U�d�D�h�9��cJN�G&[�qB�t��z����,��䍦��R�wg��G��0�Qa����qj���H��O<�\*ћ��煻��Ւ`8���A�vG��f#;3ǖ����^����u>e�o�.�C��V���o���O���Whwh��Q~��˨y;)ZB�χN«,O�hC� ��[���c�v�����"���)▊�U(;0�r����	��%�Z����OQR�� �z��	���0u��(�vl��ȃ�l��Xg�&�c�%���Gk�<+H���(��L��5F})(�/��N��20.e$F-a0\}�2m͊
\TW&8HZ=�ޠR���8-Z~�fW��ˮ)�g��cZ0���>K�!����yN��}�iS��6 �3���5�W����w6�!�4,d��׫���
��@<o�&
ڀ����U��ʩ���x��(浝���v��g,�:��v29=g�*��q�g5�*=	�x�*��WӐ߉X�?Q��^�`9���5D��Bv�<_te��;�8Ѯե��(^��>B[�54�{e��=\`%Sشb���VS㳣������#A�*IJg9�M�36��&�w¼j�!V��p�&^��L^���d�24)�!~�ZL������1
Z�I��L�Y�	r�hA�u���C?`�T���!�������"�d|?�� �2�ޝR�}�1��V����1��5-�w�G��*>��n�@�Sҷ���	"��ƫٜ�3bǅ��VF��l��� h�^�������u���4�S�B[��d��϶�L)�l��b�"���M�ѳc<�Tr�%�����~ko����~�ϑMi,�.oK���\#���Y���zH���_���Yb�g�bķ<x��i�?d+�����M\Po[���?.��3#|RT-R.�˴D
��",5E�V*�s3	v%C���z�6����]pv�r�!�4^/��^Dm-{F�cl�mO�,/�ĐNj�9���\l��5��o�5��_��G���b�ުO�YY1C�Ǿ��x�E�U|���*�0��U!�	��˖�����p-J{��充آ�C(T�u�&"��9����!��*g�wt�I��r�t���x)�1��+57�`� '#�l��YA���e��d�R�G\�f�#ϔ�4�H�K���4G�N= �p�W�h�݀��ҧ�����$��n���@�#�e�smj�}'����~J��J��8�q_�Z��Y���EZ��DR�&ɇI�x��w��|�8wJҫh��$�i MFb5�Wq>(��V�����5Yd��R�����V	�421�Dh�f�:z���ޡ�k��5�|��E��_)I;lƷ���Q��j<� >a�#�����r��`�T
"S�q)m5��:b�B�p�K�(G�ElGv����)�=��
��|�X3�z�*C��D@���P��� ���H��gk��+Xaxڻ4L�G;7��v��o;Z�ooie�X���ˈ`
�l�9h��Y,96�bLzRCa��D��p��Pe�m��B�6�?Yudf���,d���H���&�ژ�|H������6аa!b�sq� �������!��3q5�ƀ�����w꟡{ޞ�Ä)?����5���r��(�������t��1�� �L��RU�NG�c���n�;�ܭ�Y��	֛4��C�'疤� �����זoy�Y�B�7��ޔBKj����h������m*�Ŏڢ�@0@����F�ӁUe��^~IK�?��1�h�1'ŉG_�]Fӝ%;ꎫi�N)gm�R�k�"9�|�LIJ��.J\�)G:I��)�V?�.�d�8@��5��X|ݑ?���)nGQ+k�	A���QV]�
�����e�ؙ(.�v����3���6���%��c�V8_7����U3��J��bc�|����N������}�g�t�gK������œ�*UgƷH�`�Ij{�(���9��gٷR���_R*u��C?1y�b�,�=���/�=͖��K�{�m�盀�p��7n�8�O��rT��'t�7��Y<[�ݴ��:��۾��g_/l$Q�rih����;q�f"�x��'��~#;���i<�
" �g� �kQ�-\�@���֑X�*�Yy�n�b�?r� ��\���[ڑ��2�"�R@�;j�6��'
�n��1�@s��XJ��+��r�ʂ���pR����ކJF?&��J; w�v��&�S��&!+{}�*�7��K��K��@m���8X�I1�Ӣk�ّq����~�{��u����p�	'��oR�c��ʈE����NF,��������ʁ��hZ������E�kXA�,x&�PЂ����W��1߫��p�"�;4�l7��3���H�	q�'�Z0O��J\uk���rM���wO�4�R�vQ�K�^�׶�L?8�G��^쵁c���rH��߃�uw�/9�c�ױ������:H�(��q���\�
 (�B߃�i�{�?�F�@s�F��{��Z��B���S�E�F�aB� lU1K_�v {pI渐�)(�`����J���8���IX���͢rfKGn�?�*+�p�ۄM8�@?��ь"�;ꔉ�_�������At�I%f�Q��axQu���G*(�vY���`���P}��x.��oC4��n!	:��7�i�����y����B�g������'=�A�m���3�d���@)^�FV���p_ci�6���^q�� �D �U�=�\3v)�I���堛9�Z47Ղ���A�:@�RpG�7�l�x_ҹln�u�M�ؽ2�v���u��>��@z�z���_�/�,j(����0�~� 2͋��	,����Bfq����o�~�4�I�k�ռ�}w��;��A�X*.��/`ͦa���^�UP��,vL��sM���Y�D
�����C�fAl%�b?�zǊ�C�hC?1}�-�l��;qSf���<vqw-P��n�\��}N?ƗI7���l ����hB�lڨ��sk|l^�x��e���<��6�]��L�Mn�=S��l>�c>{ŗ�y�D����H����b/e<��/����$l�s���ʭ�A��p�`��ť�Ke�4)we҇��3���T@���m�fA�"��R����&��r�e��J�uW�%�}e��K�*��1�k�Q��w̔�;�v!���F�M������7�a-��ZU鹄
��h޳@I�7Ӧ5h#��mB��mp��D�7��l�B�jwq~���5��o>HD���8:)|�j�b{�2^ä́��}X�'���zفO}�v��?�~V� ���[y=���'Z�13yi��^��u�?�"�FHq���w���������7��66��՞�nh�L\V��0l��ۼ�����y�H��D�Z��&@v^�B�y4.)ܢ������U���#���aW�A K�LǗ�"���!\��l	e��%��ɘU�Wɴ@�;⨘6§F�y���H�i��N��IP���c��~S�v�d���,Z�f`IN�+C[��<�7x��#�(��b�T�ޝ�/J��At+���Qc�|�0\_j�B��Dߟ�@�3{aPj�@ýp,���� M�l��aĤ�&�q�~fB}���<��J����l�\
ҍ�e�A3|Fi"��v�e��^)O|g��I4 8WQ�*F2���Ɵ yHd<G	;#Ʒ?�^�@8 ���,�[z�%QS�������}jl�R[H�ɒ*�����Zu)u���Jh6��]h(Y�l������f��Q�d��󢾶��A5H�!���ꌼ�$��xS���i���*���X��$^��V��kW�i�Ӆ�2���>�3�Ch��K��|w D��F��|*��^��n�Y�z�H�	���!s9��Z#6k*�CSuLk�N��ǔor3X6�f�w�k���\�L��:�Cii/R#��4ފ��宽ܪ��r�f����ì���!/)H2@#����fg�o��=9�v{�r63��}U����!��%2k���=[�:�1��q����~dc����p-2�.Ѡ��a�p>L�4O?��~�� �$d;j&�S��S�XL�������M�v�}!V%r��2��QC�'���ꅁ���3I��U�bzZk�y��a2�i�t#�YV,8�o�hT�zv�ٟ O�����̋d�ѹ^�����}��Z7�G�{�y�ff��q�d�-ߣ�eB1fɼM�oB��~��X40�++݊j�c3d>��H����sJ�'�G�㦰�R�!�pҁ�,�� �/S��NN/�w�
�m�C�g�9���P�8�")'ɉa�����+�2�V�>S0�~%�����hK�6I��|�bπ�݄�L�P�(�W[is�E��,T3��Lx/fx�$�'�2�8%.�p��8P�\H��;Ԉ*�����V�p���Z���v��_��ڍ?���mi�O\�5g�~%�ͮ�<^>�2x�j's�#e�fX���6
���s]��Σ8o�{xh9��SG ����ɰc��� �[���i��m�n`X"[�!�	�Il	�/}~�Q�W����.�#��}8��<).\�������cQSQ�zd���|p_�7��UI,noY(�q��2�
B�/W;�[Go�hy��}��T���{���3n�>�3Tb��QƠ�T\�m�(��.�ֽ^��;���CM���]�~d>*��[F�V�k��g���x
)ޗ�T�� �M��:sudx���SVә� R X�~|۩p;�����1�r�-�ڲ!!Ko{�
��5 $��x)W�r:;�de"A��ʬ���Zf���^{t�hL�2$��z���5�������oBG���D���Z�߭�/�&#`��,k�N3���؀(��?/�E �Q�5�v{��uŉ�D�x*JOo�S}F۫��u�C���^N�ِ��Z�+�����a��/l�I[���j!���z�Z6����u^_�B��X��g� 3<U�N	�v�y),��MɷW�N=/ƌWH��O�s�	¾����l:�cBO΂�_��?|��bn�؜R�9qQ6����Unh���	m�z�Oك���5z~y/�-b�^
׺�KO8:l?�3�J���7��,�}YaF�.���`�q�w� $������Z�޹�(����v�Z����'/�(���R�49��4P�e��bU�T����Й�ް��6�?zP���p�ef���F+p��	L�u%�y@�0	��)�����7�Z��@�U)��*N�J�B܏�+If��Hi�)��N 0wyn���y��8�u5�[��Q���'��T*�����2��~>D�w"8W�Z��o�$~����D�G��EH��~�b�>����4���E��3���c�^TY���J2,��`��~n	.�
�=��0�+�O�~V;d0��y��BTw�4?�=�g�5)N���4p&���L�t,i`�*����"�e�6i{ùE���ffQl��ꡟ�oX%v����kA��BuD���!���j��)($%EҔC�b��_�w��π�0�Gk�����˺�n"t��;�[z�wר��sTtN|�5t|{Ցy<��W�c�����c߈a%��i�#�Oi5tuB޳Z0�VԘ��7��e2�������"w��=�(hr�%]��.�6�����ح ��TI6lC�6��|���*�7�w�3c���U�*y-齼]�A����ʃt�T �����]��H5�+�a$�J��\6�HhhɌ5M(W�<���<!�މ��=�8�d���٬L"��J�|��*�,[�":&~5��C����u��
���k���0��#
���X��NU&��	�����qf;/�=}i[��/�'{!K�C�i@��϶��1kG�[#�u��)A�L��O�\�}a�����J;+��4UC){1a��\`w9�V�ғ!,����y�FQEM%������P���j�8��w�q>�%X�Rc���8%ր�;nX�ƗBiY[<��6]�)�8Lg�p���l���U	��	���#B;hȵ7�@R�b�{����2
|�m�[�:JCH&;���9g���L��CX��
�"�������M�F�u���ǧ��f<�����q��$�9\��K����VP��"��>�3��7y�����%r�@K/�}Z�svp+V����~$�o����Q��YB����`q�n^X��Ɯ��hV"%�3�H�r���N����!ՙ>�ut�f�Ġ�{G8�O�>�&��+Ѝ�a�$��m�{�l�R
�PM��X�k��������~1MB���qA�'S5����aX1�O��Ck"NO�H��*��|�c����0�������� �>�I��' ��T�\�h�d�^�%q~�m�o��t(��`^��SB���O�k�G��e����������Q��%��/�e�<��81�>KOL�]�H��u�2<�#Q��TڶAȢ�h�%��*D)�F��7��\���Yl�_<������v;M�p��n���������k4�~b�0��u�\t��TM�ۣ	J?n���"���Z(9˘ˍ��߆U�Lr�R��96�Dz�H�Vd�5�C�^����j�@罆��G�A{���б��û`
���g�/�P�7�i�e����h����y��4K�߮��Y�k����4����;0`��h�e��n��pti���dIHdFH=��$����|�F��rK4Vl=ە�d�4�a%H�#2�^r���R��c�#p=���)~�KJptSȄ�$%[��"�A�~���(�-�d��-��.�I�����JA�x�1s��:S�v��^!]V$=����'
n$��
ܴF�m;#s�ox)mj�2(��7��5˄R$a��{)�C�4�������/�����:��}2��ڣ�/��?ᶣ�&�Fړ+߮[��\�|���l�+Q"��^�{�qpƗ�X���݉�zH;�.�dUkvp�LX�� � ����1ـ6���x	�j)|)}X�F5�G���1A���M�3dH�	�>�M���T���L���T���S��7����=����
���aNG����.K�s�ܣ�_ueU&�r�r�}`<*ϔ[Y�(�9�k\9�n#pT�/����٣'"Xem�Ll�%�z�1VCtB�'�H�`A�r��-���Q$�ȱ�yk�ɴ�V���ǤܕL�w�-�]�������D��j˩�rC�ۙ`.ϳ�]Q�/c�<}*-������:��WjL�o��3$,P�V0�#Џ�g���T^�w勻�/'J4K�L����X�q6�x�����t��0�7��y�oJa�2�zM���O�u��尚���x.��a����v��6j��q���/�m�Q�w�F[�d�㩅^�Ru^�fB+{k�7T�hO�K?1�w�Ｐ�w ��Tt]�Y=Zx\Dd�2�p7�$]GGCcf�xnvI�� �~oՖ�u��E�������M��L_�L%kh,^�����g��!9:�k2b;5*�/��F���2������������{|#|B���W7(Z~�ׁ�ŻPX�J���)��j*
�$��������~��Ը∁Xub�6I�u<������I�d���>]gl�+Qچ�r ݃^s��|k()l��hN�������D�_��I�3�\j��1�&2a�Ho���(�t�R��&D�RF`$o{Y����`|<=������o$�.��xF>ZV�����&'�����3��(%]#s�RUU��$�JrWi������ֵ�X�pj�l��8�̉�9�Qdy6�r`2����S*��;�s9�t���ҧ�Zp	$���\�.&��(I��݃�5:.�>X�-.��u;kB;����Z�ˮ�Fw���o�^L@�I��t��E�\���|�9�G��:��vJU)B�#� _�DY�m�G)b���8�~��%�V8R�_]�`IW엏!�Ӎ�C0�r��I˕)m~�,�*, 7<�ֶ��K%37Ut���^�� ���A����g��4i���ϐH�� ��s��s��l��R�n{�b$Ʃ���B�V6����?]h7����\[*���qn�C������;>�*��rhR��@�����4��w�(9>"b�5n����E>I<����c?��W�~��V��hi�=�L��Z��Yֳ��ְ$*��o�3W(x1z������H_��O2� [�&j׾:�h�!sm��D�a��x�څI��ԘoD�}�gAL:��<d}��NVvF\�#>���ݙ%���z3ϒ@շE�
Z9���C��!5�w����3��L��W�Q��+��%�u�@���k�k0t�\�l 9�f�TO�d�$���Q���ٌ�b��a)��R٦'��ꖖ�R��s �,�O��/N��{�I|6��T�Q��T�O��.j��W=�k��>���:_���d����ǟ�|ԨR/�-|��ɾ=��5u�;;[ݦdeS�;S��q��zu� �0�ت�F�V�_�r�L.����a�w��Wb7�-}h?%ú��8İ�J����܀���@��̊>��UHbm��H .�4�
�\�)�N��BFE�G���vCA:\-Y�0=�Q���iCR�ܘ�V���A�P̶���� >-����~��R5q�=>��*B���3!�/�N�'�M���g�.'\�]�a�;�i�_"��u"�YX/���[u 4��0M��'��L^���Y������\�Oy�-����m��h]�{dqd����yY�����pvF8�ꕊr��]�}��˱�/c
O�=ަ��* �#�u�8���t�G�突�(kwz`�.WOic�s�%Se��P��1 ��RՈ�+,[W����lD8^�qքgF�_:�� �E/�å�赌@:RG�><��h��gD�ޤ���c�����!��&�\`�!1D��9@	�[��㩷�0u����B�Q��R�}Om� j.���GfM��WXk�������/��ZP�d�v�,��8^�����f�uQ�SN����l��4�R �[%��ɛݥ�w��Y�Vc�������{�J�+"�9���A5�14�Ԁ�ox��)G��$7�!w��C�B��?g��kw�5����k��_wg�	������Ϫ!}��x�w	q���t�j%I2�#������y�d���C�+`�W�DII�مƣn�2���*k�egcyFs��l�f��ܽH�Fv�e���O�|�נ`� �XɹoP�����R��J��
c��X>4W��S#���)�5��e�7ѲJ%k��
r��@S�y���+�b-Y{}�5��s���t`v�V���=L��L�xw��t�ψG�a���u�����47���D�d��y0�`��n;�ڨ�� Y����8��&���Ӓ��V�w�n�]o���$N�۰e:{$��1$�l>���3ȓ��a|�;�'s��?e:4jt6/}
�aFY76!��6��������!+�����J�u���v�L��*"g#��?�*��+|ʲ�x��󤔾�v����T�14 Q���vlb�S)H�������Aˊ,"��{�
G˝ޏ��s[�E7x�3k�K��dR(�sI"6٩
����e+R�zEr.�vx����nY��Ŕ�S\���&	�2������!��k5{��'B����IHMJY�Z]U�DD)M�a�w�Ƽ�&L,R�O�o�h��ϕ_(&�a�6uK=�b��)����ʗ=��AlV5w�%%5$|@рL	�0��(I�&1@(���8P֥ ߖ����K��G&�3sE����[�'e�A����x���H��)a���,��7I� ��C��.��o�Q�"������B#J6��gO����D��5G4~u�\��d�����# �m��G�x��V�<0��D%�B�,���s��'dR[���/
���h���>������3�N��S-ӂ�v$�"��)�N7�N�(��vw޼�G�.|�Y��ʌw�+����k�/d��/@H̄dk]|0��X�_��yG��AGX���֔��ޕ�ŃQŰ��,�=4�	I��-жi�tC���C	gI�R	�k��y��wc��R������yh��_-]�G�z�.:�)+0�pZ���J+��Y��`#2B;0�m24S��"c!�cs�W�Z�xѫv;6��պ�08�Q-Ҏ�
��B	������-�-�%�d��F� ��3�����|�}Ǐ8���%�C"t���(�e7wXj1���>���b����*�Ѳ�E�n݊�q;h5�:����䗳�"������mB���+��*���#7�I�'�4���N���~K��^�r�~���2< i��U�7�S27�ʌU#�:�m0ྦ��h��F(��a=��Pr���U���쉄�Xq�%�i�*d�oCl��ǿ��Ȁ��*�Ge��A��"Y0��q]!��į@��nI�f�R�K6�Ķ��n���{@ )"%1�n:�{6tł7��Ys�E~���ͽ�*���J쫱g翸���˻σY_�6ݣ�-���r�f����3#�Q&Ȝ���/:�EZ��IWVq+)�0��B7�jdY�~����+�d�{B� 0�s�A����<I�I����u�TN$��������$�L����c�I8z��/|�,Q0L�o�3f3������F��_?:!	O�������/e��h�oǶ�)��b��6���fu֐�Լ��#� Q�g��֨��na*��,�O���E��f+�fܧM0��Xtd�~�Vr��s����t�~ !} �H��x�T���?bu�f�k4R�Ιj?����5𙍲��un!ﻎ�x�9�����E����z�"29�]s�*��,#�:KyR�n�m�e�@��҆Ot��A�~�&��hG��+p�^�����u@����2��	�X��r������LBWO�q-T��[��vWUTQ��ur�z��$����Iw��ŠI��N}j�v�d����O�:�\����*�K�g�LV���o�_�9�	��K���[,�č<7��ʯ>?ϰ?yU;��g w	� W#�������8�8�zTZ?����D��H#k�8C�ى�ߘ�X���J���v�y�0Kf}R[qw?$_��鍺�`�Mm6�~b�_�eZ"2�(�.%�MC�ؔ�y�����_S'���a���_�E��ᝑW����T�x���]>��ȍ~'�VQ6�E.�h���P���W1�(�� �ί� 0�m82%�l��VKb�=�Q��6h��1H#��!�"���)ie�1��Ƹ�~yv"�=p�Q�;f8�/�8��D��fWAbcɓ�ٌ
�R.J?�����< +�njV��,v���]Qױ�U��eQ?�u��q�I0A�`�n��h����nS>�(���l��w�aG��&M��7�����`'�:�)q.˜3�w':ۉO��[ĦuM�\ސ��k}ᄟ�'ڝ��ԔQ
�;t.�;��n���d�?O����~�`�ӔĨ1o�#�h]�V�7y\dPjG�8�	����/�79���5�f�A���$[�-�,u灤 ���.:~������8�a&�5oو��4���O�����S?}��t#p�1ʾ��釗_N.q������Ԋ_@D�)�QZƖ���eD�����o9�^U�T��9#��Y�QG����>ƵII��������y��AU���E�@LH��\���\����������  ZG3G''} Zs'c; Z['cZA	'}ӿG�6δ��VF4�F ���L���������������#.�������ݿ�9[���Ŀ{vVN�(i����.���_'c���&���$[#}'} Zc3]}kc]3#�����wp�w�'��W}ksC�\�E�yGG ZC[kkc��g���6~�~��<I�?|O~7$�͂�3?����̠$��? �W%��?r���l��J���o
�<��k ��o=�o������3����߾,�U�_?ٿ=O~�}N~+���j����{��G�������7��������~����7/��/�o��#��w̟��gG�O�ߊ����<>�����g�i��¿����F�������P����[��q�U!�����x��YU�7���������W��~�_�����ϼ5�?|�~������*����(]�_� ����_����b����~�a��7�;�o�������k������Sz�����7��7��ϟ�ǧ_�7�;'����*���Wק�c�o��}?��������������K]�q�y  