package com.sulake.habbo.nux
{
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class NuxOfferOldUserView 
    {
        private var _frame:IFrameWindow;
        private var _component:HabboNuxDialogs;

        public function NuxOfferOldUserView(k:HabboNuxDialogs)
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
            var k:XmlAsset = (this._component.assets.getAssetByName("nux_offer_old_user_xml") as XmlAsset);
            this._frame = (this._component.windowManager.buildFromXML((k.content as XML)) as IFrameWindow);
            if (this._frame == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            this._frame.center();
            var _local_2:IWindow = this._frame.findChildByTag("close");
            if (_local_2)
            {
                _local_2.visible = false;
            }
            _local_2 = this._frame.findChildByName("btnSkip");
            _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_19003);
            _local_2 = this._frame.findChildByName("btnGo");
            _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_17239);
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            this.hide();
        }

        private function _Str_17239(k:WindowMouseEvent):void
        {
            this._component._Str_17239();
            this.hide();
        }

        private function _Str_19003(k:WindowMouseEvent):void
        {
            this._component._Str_19003();
        }
    }
}
