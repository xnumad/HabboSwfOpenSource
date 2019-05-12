package com.sulake.habbo.nux
{
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class NuxNoobRoomOfferView 
    {
        private var _frame:IFrameWindow;
        private var _component:HabboNuxDialogs;

        public function NuxNoobRoomOfferView(k:HabboNuxDialogs)
        {
            this._component = k;
            this.show();
        }

        public function dispose():void
        {
            if (this._frame)
            {
                this._frame.dispose();
                this._frame = null;
            }
            this._component = null;
        }

        private function hide():void
        {
            if (this._component)
            {
                this._component._Str_8646();
            }
        }

        private function show():void
        {
            if (this._frame != null)
            {
                return;
            }
            var k:XmlAsset = (this._component.assets.getAssetByName("nux_noob_room_offer_xml") as XmlAsset);
            this._frame = (this._component.windowManager.buildFromXML((k.content as XML)) as IFrameWindow);
            if (this._frame == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            this._frame.x = (this._frame.y = 20);
            var _local_2:IWindow = this._frame.findChildByName("btnGo");
            if (_local_2)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_23291);
            }
            var _local_3:IWindow = this._frame.findChildByTag("close");
            if (_local_3)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            }
        }

        private function _Str_23291(k:WindowMouseEvent):void
        {
            this._component.context.createLinkEvent("navigator/goto/predefined_noob_lobby");
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            this._component._Str_11922();
        }
    }
}

