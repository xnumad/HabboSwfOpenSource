//com.sulake.habbo.furni.stickie.StickieCtrl

package com.sulake.habbo.furni.stickie{
    import feathers.controls.ScrollContainer;
    import com.sulake.core.communication.connection.IConnection;
    import feathers.controls.LayoutGroup;
    import feathers.display.Scale9Image;
    import feathers.controls.Label;
    import starling.display.Image;
    import __AS3__.vec.Vector;
    import starling.display.Button;
    import flash.events.Event;
    import starling.events.TouchEvent;
    import starling.events.Event;
    import starling.display.DisplayObject;

    public class StickieCtrl extends ScrollContainer {

        private static const ALLOWED_COLORS:Array;
        private static const WIDTH:int;
        private static const HEIGHT:int;
        private static const TEXT_MARGIN:int;

        private var _connection:IConnection;
        private var _allowEditing:Boolean;
        private var _viewContainer:LayoutGroup;
        private var _bg:Scale9Image;
        private var _content:Label;
        private var _lastRequestedObjectId:int;
        private var _modalOverlay:Image;
        private var _editView:EditView;
        private var _colorHex:String;
        private var _colorButtons:Vector.<Button>;
        private var _requireSave:Boolean;

        public function StickieCtrl(k:IConnection);

        override public function dispose():void;

        public function set allowEditing(k:Boolean):void;

        function get content():String;

        function get color():uint;

        public function handleEvent(k:Event):void;

        private function showFromData(k:String):void;

        private function hide():void;

        private function show(k:uint, _arg_2:String):void;

        private function createView():void;

        private function onStickieTouched(k:TouchEvent):void;

        private function onColorButton(k:Event):void;

        private function onDelete(k:Event):void;

        private function showEdit():void;

        public function saveEdit(k:String):void;

        public function cancelEdit():void;

        private function hideEditView():void;

        private function getModalOverlay():DisplayObject;

        private function onModalOverlayTouch(k:TouchEvent):void;

        private function sendSave():void;


    }
}//package com.sulake.habbo.furni.stickie

