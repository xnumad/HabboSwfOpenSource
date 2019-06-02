//com.sulake.habbo.messenger.view.ConversationAction

package com.sulake.habbo.messenger.view{
    import com.sulake.feathers.controls.IAccordionItemData;
    import starling.textures.Texture;
    import __AS3__.vec.Vector;

    public class ConversationAction implements IAccordionItemData {

        public static const ID_CLOSE:int;
        public static const ID_FOLLOW:int;
        public static const ID_PROFILE:int;

        private var _peerId:int;
        private var _id:int;
        private var _label:String;
        private var _iconSource:Texture;

        public function ConversationAction(k:int, _arg_2:int);

        public function get peerId():int;

        public function get id():int;

        public function get label():String;

        public function get iconSource():Object;

        public function get childDataItems():Vector.<IAccordionItemData>;


    }
}//package com.sulake.habbo.messenger.view

