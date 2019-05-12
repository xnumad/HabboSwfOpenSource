package com.sulake.habbo.catalog.viewer
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.core.window.IWindowContainer;
    import flash.display.BitmapData;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.habbo.room.object.RoomObjectOperationEnum;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.room.ISelectedRoomObjectData;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import flash.display.Sprite;
    import flash.display.Bitmap;

    public class _Str_9030 implements IGetImageListener 
    {
        private static const CATALOGOVERLAYSPRITE:String = "CatalogOverlaySprite";

        private var _roomEngine:IRoomEngine;
        private var _mainContainer:IWindowContainer;
        private var _state:Boolean = false;


        public function set roomEngine(k:IRoomEngine):void
        {
            this._roomEngine = k;
        }

        public function set mainContainer(k:IWindowContainer):void
        {
            this._mainContainer = k;
        }

        public function get state():Boolean
        {
            return this._state;
        }

        public function dispose():void
        {
            this._Str_20422();
            this._mainContainer = null;
            this._roomEngine = null;
            this._state = false;
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
        }

        public function imageFailed(k:int):void
        {
        }

        public function _Str_10415(k:WindowEvent, _arg_2:IWindow, _arg_3:ISelectedRoomObjectData):void
        {
            var _local_4:WindowMouseEvent;
            var _local_5:int;
            var _local_6:int;
            var _local_7:ImageResult;
            if (this._roomEngine == null)
            {
                return;
            }
            _local_4 = (k as WindowMouseEvent);
            switch (k.type)
            {
                case WindowMouseEvent.MOVE:
                    if (((_arg_3 == null) || (!(_arg_3.operation == RoomObjectOperationEnum.OBJECT_PLACE))))
                    {
                        return;
                    }
                    _local_5 = _local_4.stageX;
                    _local_6 = _local_4.stageY;
                    if (this._Str_15245() == null)
                    {
                        _local_7 = this._Str_6819(_arg_3);
                        if (_local_7 == null)
                        {
                            return;
                        }
                        this._Str_25523(_local_7.data);
                    }
                    this._state = true;
                    this._Str_25277(_local_5, _local_6);
                    return;
                case WindowMouseEvent.OUT:
                    if (this._state)
                    {
                        if (((((_local_4.localX >= 0) && (_local_4.localX < k.target.width)) && (_local_4.localY >= 0)) && (_local_4.localY < k.target.height)))
                        {
                            return;
                        }
                        this._Str_16533();
                    }
                    return;
            }
        }

        public function _Str_16533():void
        {
            if (this._state)
            {
                this._Str_20422();
                this._state = false;
            }
        }

        private function _Str_6819(k:ISelectedRoomObjectData):ImageResult
        {
            var _local_2:ImageResult;
            if (((k == null) || (this._roomEngine == null)))
            {
                return null;
            }
            if (k.category == RoomObjectCategoryEnum.CONST_10)
            {
                return this._roomEngine.getFurnitureIcon(k.typeId, this);
            }
            if (k.category == RoomObjectCategoryEnum.CONST_20)
            {
                return this._roomEngine.getWallItemIcon(k.typeId, this, k._Str_4766);
            }
            return null;
        }

        private function _Str_25523(k:BitmapData):void
        {
            if (((((k == null) || (this._mainContainer == null)) || (this._mainContainer.desktop == null)) || (!(this._Str_15245() == null))))
            {
                return;
            }
            var _local_2:Sprite = (this._mainContainer.desktop.getDisplayObject() as Sprite);
            var _local_3:Sprite = new Sprite();
            _local_3.name = CATALOGOVERLAYSPRITE;
            _local_3.mouseEnabled = false;
            _local_3.visible = true;
            var _local_4:Bitmap = new Bitmap(k);
            _local_3.addChild(_local_4);
            _local_2.addChild(_local_3);
        }

        private function _Str_15245():Sprite
        {
            if (((this._mainContainer == null) || (this._mainContainer.desktop == null)))
            {
                return null;
            }
            var k:Sprite = (this._mainContainer.desktop.getDisplayObject() as Sprite);
            var _local_2:Sprite = (k.getChildByName(CATALOGOVERLAYSPRITE) as Sprite);
            return _local_2;
        }

        private function _Str_25277(k:int, _arg_2:int):void
        {
            var _local_3:Sprite = this._Str_15245();
            if (_local_3 == null)
            {
                return;
            }
            _local_3.x = (k - Math.round((_local_3.width / 2)));
            _local_3.y = (_arg_2 - Math.round((_local_3.height / 2)));
        }

        private function _Str_20422():void
        {
            if ((((this._mainContainer == null) || (this._mainContainer.desktop == null)) || (this._Str_15245() == null)))
            {
                return;
            }
            var k:Sprite = (this._mainContainer.desktop.getDisplayObject() as Sprite);
            var _local_2:Sprite = (k.getChildByName(CATALOGOVERLAYSPRITE) as Sprite);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:Bitmap = (_local_2.removeChildAt(0) as Bitmap);
            if (((!(_local_3 == null)) && (!(_local_3.bitmapData == null))))
            {
                _local_3.bitmapData.dispose();
            }
            k.removeChild(k.getChildByName(CATALOGOVERLAYSPRITE));
        }
    }
}
