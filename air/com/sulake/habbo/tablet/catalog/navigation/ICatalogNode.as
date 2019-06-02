//com.sulake.habbo.tablet.catalog.navigation.ICatalogNode

package com.sulake.habbo.tablet.catalog.navigation{
    import __AS3__.vec.Vector;

    public /*dynamic*/ interface ICatalogNode {

        function dispose():void;
        function get depth():int;
        function get label():String;
        function get pageId():int;
        function get pageName():String;
        function get children():Vector.<ICatalogNode>;
        function get offerIds():Vector.<int>;
        function addChild(k:ICatalogNode):void;
        function get parent():ICatalogNode;
        function get iconName():String;
        function get visible():Boolean;

    }
}//package com.sulake.habbo.tablet.catalog.navigation

