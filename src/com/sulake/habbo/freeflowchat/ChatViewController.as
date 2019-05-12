package com.sulake.habbo.freeflowchat
{
    import com.sulake.core.runtime.IDisposable;
    import flash.display.DisplayObjectContainer;
    import flash.display.Stage;
    import com.sulake.habbo.freeflowchat.viewer.ChatFlowViewer;
    import com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryTray;
    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.events.Event;

    public class ChatViewController implements IDisposable 
    {
        private var _rootDisplayObject:DisplayObjectContainer;
        private var _registeredStage:Stage;
        private var _component:HabboFreeFlowChat;
        private var _flowViewer:ChatFlowViewer;
        private var _pulldown:ChatHistoryTray;
        private var _flowViewerDisplayObject:DisplayObject;
        private var _pulldownDisplayObject:DisplayObject;

        public function ChatViewController(k:HabboFreeFlowChat, _arg_2:ChatFlowViewer, _arg_3:ChatHistoryTray)
        {
            this._component = k;
            this._flowViewer = _arg_2;
            this._pulldown = _arg_3;
            this._flowViewerDisplayObject = this._flowViewer._Str_5128;
            this._pulldownDisplayObject = this._pulldown._Str_5128;
            this._rootDisplayObject = new Sprite();
            this._rootDisplayObject.addChild(this._flowViewerDisplayObject);
            this._rootDisplayObject.addChild(this._pulldownDisplayObject);
            this._rootDisplayObject.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        }

        public function dispose():void
        {
            if (this._rootDisplayObject)
            {
                this._component.removeUpdateReceiver(this._pulldown);
                if (this._registeredStage)
                {
                    this._registeredStage.removeEventListener(Event.RESIZE, this._Str_11094);
                }
                this._rootDisplayObject.removeChild(this._pulldownDisplayObject);
                this._rootDisplayObject.removeChild(this._flowViewerDisplayObject);
                this._rootDisplayObject.removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
                this._rootDisplayObject = null;
                this._pulldownDisplayObject = null;
                this._flowViewerDisplayObject = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._rootDisplayObject == null;
        }

        public function get _Str_5128():DisplayObject
        {
            return this._rootDisplayObject;
        }

        private function onAddedToStage(k:Event):void
        {
            this._registeredStage = this._rootDisplayObject.stage;
            this._registeredStage.addEventListener(Event.RESIZE, this._Str_11094);
            this._pulldown.resize(this._registeredStage.stageWidth, this._registeredStage.stageHeight);
            this._component.registerUpdateReceiver(this._pulldown, 200);
        }

        private function _Str_11094(k:Event):void
        {
            this._pulldown.resize(this._registeredStage.stageWidth, this._registeredStage.stageHeight);
            this._flowViewer.resize(this._registeredStage.stageWidth, this._registeredStage.stageHeight);
        }
    }
}
