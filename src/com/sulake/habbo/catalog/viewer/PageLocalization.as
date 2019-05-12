package com.sulake.habbo.catalog.viewer
{
    import flash.utils.Dictionary;

    public class PageLocalization implements IPageLocalization 
    {
        public static const CATALOG_HEADER_IMAGE:String = "catalog.header.image";
        public static const CATALOG_HEADER_ICON:String = "catalog.header.icon";
        public static const CATALOG_HEADER_TITLE:String = "catalog.header.title";
        public static const CATALOG_HEADER_DESCRIPTION:String = "catalog.header.description";
        private static const _Str_17252:Array = [CATALOG_HEADER_DESCRIPTION, "ctlg_description", "ctlg_special_txt", "ctlg_text_1", "ctlg_text_2"];
        private static const _Str_15924:Array = [CATALOG_HEADER_IMAGE, "ctlg_teaserimg_1", "ctlg_special_img", "ctlg_teaserimg_2", "ctlg_teaserimg_3"];
        private static const _Str_15198:Dictionary = new Dictionary();
        private static const _Str_3902:Dictionary = new Dictionary();
        private static const _Str_5903:Dictionary = new Dictionary();

        private var _images:Array;
        private var _texts:Array;

        {
            _Str_15198["frontpage4"] = [PageLocalization.CATALOG_HEADER_IMAGE, "ctlg_teaserimg_1"];
            _Str_3902["camera1"] = [CATALOG_HEADER_DESCRIPTION, "ctlg_text_1"];
            _Str_3902["presents"] = [CATALOG_HEADER_DESCRIPTION, "ctlg_text1"];
            _Str_3902["pets"] = [CATALOG_HEADER_DESCRIPTION, "ctlg_text_1", "ctlg_text_2", "ctlg_text_3"];
            _Str_3902["pets2"] = [CATALOG_HEADER_DESCRIPTION, "ctlg_text_1", "ctlg_text_2", "ctlg_text_3"];
            _Str_3902["pets3"] = [CATALOG_HEADER_DESCRIPTION, "ctlg_text_1", "ctlg_text_2", "ctlg_text_3"];
            _Str_3902["info_rentables"] = [CATALOG_HEADER_DESCRIPTION, "ctlg_text_1", "ctlg_text_2", "ctlg_text_3", "ctlg_text_4", "ctlg_text_5"];
            _Str_3902["info_duckets"] = ["ctlg_description"];
            _Str_3902["info_loyalty"] = ["ctlg_description"];
            _Str_3902["trophies"] = ["trophy.description", "trophy.enscription"];
            _Str_3902["frontpage4"] = ["ctlg_txt1", "ctlg_txt2"];
            _Str_3902["builders_club_frontpage"] = ["ctlg_description"];
            _Str_3902["builders_club_addons"] = ["ctlg_description"];
            _Str_3902["builders_club_loyalty"] = ["ctlg_description"];
            _Str_5903["club_buy"] = ["club_link"];
            _Str_5903["mad_money"] = ["ctlg_madmoney_button"];
            _Str_5903["monkey"] = ["ctlg_teaserimg_1_region", "ctlg_special_img_region"];
            _Str_5903["niko"] = ["ctlg_teaserimg_1_region", "ctlg_special_img_region"];
            _Str_5903["pets3"] = ["ctlg_text_3"];
        }

        public function PageLocalization(k:Array, _arg_2:Array)
        {
            this._images = k;
            this._texts = _arg_2;
        }

        public function get imageCount():int
        {
            return this._images.length;
        }

        public function get textCount():int
        {
            return this._texts.length;
        }

        public function dispose():void
        {
            this._images = null;
            this._texts = null;
        }

        public function hasLinks(k:String):Boolean
        {
            return !(_Str_5903[k] == null);
        }

        public function _Str_20312(k:String):Array
        {
            return _Str_5903[k];
        }

        public function getTextElementName(k:int, _arg_2:String):String
        {
            var _local_3:Array = _Str_3902[_arg_2];
            if (_local_3 == null)
            {
                _local_3 = _Str_17252;
            }
            if (k < _local_3.length)
            {
                return _local_3[k];
            }
            return "";
        }

        public function getImageElementName(k:int, _arg_2:String):String
        {
            var _local_3:Array = _Str_15198[_arg_2];
            if (_local_3 == null)
            {
                _local_3 = _Str_15924;
            }
            if (k < _local_3.length)
            {
                return _local_3[k];
            }
            return "";
        }

        public function getTextElementContent(k:int):String
        {
            if (k < this._texts.length)
            {
                return this._texts[k];
            }
            return "";
        }

        public function getImageElementContent(k:int):String
        {
            if (k < this._images.length)
            {
                return this._images[k];
            }
            return "";
        }

        public function _Str_22305(k:int):uint
        {
            var _local_2:String;
            if (k < this._texts.length)
            {
                _local_2 = String(this._texts[k]).replace("#", "0x");
                return uint(Number(_local_2));
            }
            return 0;
        }
    }
}
