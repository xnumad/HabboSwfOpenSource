//com.sulake.habbo.communication.messages.incoming.catalog.NodeData

package com.sulake.habbo.communication.messages.incoming.catalog{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class NodeData {

        private var _visible:Boolean;
        private var _icon:int;
        private var _pageId:int;
        private var _pageName:String;
        private var _localization:String;
        private var _children:Vector.<NodeData>;
        private var _offerIds:Vector.<int>;

        public function NodeData(k:IMessageDataWrapper);

        public function get visible():Boolean;

        public function get icon():int;

        public function get pageId():int;

        public function get pageName():String;

        public function get localization():String;

        public function get children():Vector.<NodeData>;

        public function get offerIds():Vector.<int>;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

