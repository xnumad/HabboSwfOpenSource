//com.sulake.habbo.tablet.catalog.viewer.IPageLocalization

package com.sulake.habbo.tablet.catalog.viewer{
    public /*dynamic*/ interface IPageLocalization {

        function get imageCount():int;
        function get textCount():int;
        function getTextElementName(k:int, _arg_2:String):String;
        function getImageElementName(k:int, _arg_2:String):String;
        function getTextElementContent(k:int):String;
        function getImageElementContent(k:int):String;
        function dispose():void;
        function hasLinks(k:String):Boolean;
        function getLinks(k:String):Array;
        function getColorUintFromText(k:int):uint;

    }
}//package com.sulake.habbo.tablet.catalog.viewer

