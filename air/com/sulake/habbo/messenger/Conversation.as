//com.sulake.habbo.messenger.Conversation

package com.sulake.habbo.messenger{
    import com.sulake.feathers.controls.IAccordionItemData;
    import __AS3__.vec.Vector;
    import starling.textures.Texture;
    import feathers.data.ListCollection;

    public class Conversation implements IAccordionItemData {

        private static var _freeIdCounter:int;

        private var _id:int;
        private var _iconSource:Object;
        private var _childDataItems:Vector.<IAccordionItemData>;
        private var _peerId:int;
        private var _peerName:String;
        private var _peerFigure:String;
        private var _peerTexture:Texture;
        private var _messages:ListCollection;
        private var _hasUnseenMessages:Boolean;

        public function Conversation(k:int);

        public function dispose():void;

        public function get label():String;

        public function get hasUnseenMessages():Boolean;

        public function set hasUnseenMessages(k:Boolean):void;

        public function addMessage(k:ConversationMessage):void;

        public function addTimeStamp(k:int):void;

        public function get messages():ListCollection;

        public function get peerId():int;

        public function set peerTexture(k:Texture):void;

        public function get peerTexture():Texture;

        public function get peerName():String;

        public function set peerName(k:String):void;

        public function get peerFigure():String;

        public function set peerFigure(k:String):void;

        public function get id():int;

        public function get iconSource():Object;

        public function set iconSource(k:Object):void;

        public function get childDataItems():Vector.<IAccordionItemData>;

        public function set childDataItems(k:Vector.<IAccordionItemData>):void;


    }
}//package com.sulake.habbo.messenger

