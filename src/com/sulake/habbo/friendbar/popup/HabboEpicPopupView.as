package com.sulake.habbo.friendbar.popup
{
    import com.sulake.habbo.friendbar.view.AbstractView;
    import com.sulake.habbo.friendbar.IHabboEpicPopupView;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.quest.EpicPopupMessageEvent;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class HabboEpicPopupView extends AbstractView implements IHabboEpicPopupView 
    {
        private var _communicationManager:IHabboCommunicationManager;
        private var _activeFrame:IWindowContainer;

        public function HabboEpicPopupView(k:IContext, _arg_2:uint, _arg_3:IAssetLibrary)
        {
            super(k, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communicationManager = k;
            })]));
        }

        override public function dispose():void
        {
            if (this._activeFrame != null)
            {
                this._activeFrame.dispose();
                this._activeFrame = null;
            }
            super.dispose();
        }

        override protected function initComponent():void
        {
            this._communicationManager.addHabboConnectionMessageEvent(new EpicPopupMessageEvent(this._Str_24581));
        }

        private function _Str_24581(k:EpicPopupMessageEvent):void
        {
            this._Str_8168(k.getParser()._Str_24035);
        }

        public function _Str_8168(k:String):void
        {
            if (this._activeFrame != null)
            {
                this._activeFrame.dispose();
            }
            this._activeFrame = (_Str_2277.buildFromXML((assets.getAssetByName("epic_popup_frame_xml").content as XML)) as IWindowContainer);
            IStaticBitmapWrapperWindow(this._activeFrame.findChildByName("content_static_bitmap")).assetUri = k;
            this._activeFrame.procedure = this._Str_12416;
            this._activeFrame.center();
        }

        private function _Str_12416(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((!(this._activeFrame == null)) && (k.type == WindowMouseEvent.CLICK)))
            {
                switch (k.target.name)
                {
                    case "close_button":
                    case "header_button_close":
                        this._activeFrame.dispose();
                        this._activeFrame = null;
                        return;
                }
            }
        }
    }
}
