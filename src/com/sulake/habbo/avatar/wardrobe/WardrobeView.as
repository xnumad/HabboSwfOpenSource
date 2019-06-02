package com.sulake.habbo.avatar.wardrobe
{
    import com.sulake.habbo.avatar.common.ISideContentView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.XmlAsset;

    public class WardrobeView implements ISideContentView 
    {
        private var _window:IWindowContainer;
        private var _model:WardrobeModel;
        private var _slotList:IItemListWindow;
        private var _vipSlotList:IItemListWindow;
        private var _slotWindowTemplate:IWindow;

        public function WardrobeView(k:WardrobeModel)
        {
            this._model = k;
            var _local_2:XmlAsset = (this._model.controller.manager.assets.getAssetByName("avatareditor_wardrobe_base") as XmlAsset);
            this._window = (this._model.controller.manager.windowManager.buildFromXML((_local_2.content as XML)) as IWindowContainer);
            this._slotList = (this._window.findChildByName("hc_slots") as IItemListWindow);
            this._vipSlotList = (this._window.findChildByName("vip_slots") as IItemListWindow);
            this._slotWindowTemplate = this._window.findChildByName("slot_template");
            if (this._slotWindowTemplate)
            {
                this._window.removeChild(this._slotWindowTemplate);
            }
            this._window.visible = false;
        }

        public function get _Str_23743():IWindow
        {
            return this._slotWindowTemplate;
        }

        public function dispose():void
        {
            this._model = null;
            this._slotList = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function update():void
        {
            var _local_2:_Str_4142;
            if (this._slotList)
            {
                this._slotList.removeListItems();
            }
            if (this._vipSlotList)
            {
                this._vipSlotList.removeListItems();
            }
            var k:Array = this._model._Str_22986;
            var _local_3:int;
            while (_local_3 < k.length)
            {
                _local_2 = k[_local_3];
                if (_local_3 < 5)
                {
                    if (this._slotList)
                    {
                        this._slotList.addListItem(_local_2.view);
                        _local_2.view.visible = true;
                    }
                }
                else
                {
                    if (this._vipSlotList)
                    {
                        this._vipSlotList.addListItem(_local_2.view);
                        _local_2.view.visible = true;
                    }
                }
                _local_3++;
            }
        }

        public function getWindowContainer():IWindowContainer
        {
            return this._window;
        }
    }
}

