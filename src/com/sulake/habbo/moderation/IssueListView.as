package com.sulake.habbo.moderation
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindowContainer;
    import flash.display.BitmapData;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_2484;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.utils.getTimer;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class IssueListView 
    {
        private var _issueManager:IssueManager;
        private var _issueBrowser:IssueBrowser;
        private var _list:IItemListWindow;
        private var _listItem:IWindowContainer;
        private var _userIcon:BitmapData;
        private var _roomIcon:BitmapData;
        private var _issueListLimit:int = 200;

        public function IssueListView(k:IssueManager, _arg_2:IssueBrowser, _arg_3:IItemListWindow)
        {
            this._issueManager = k;
            this._issueBrowser = _arg_2;
            this._list = _arg_3;
            this._listItem = (_arg_3.getListItemAt(0) as IWindowContainer);
            _arg_3.removeListItems();
            this._issueListLimit = k._Str_25472;
        }

        public function update(k:Array):void
        {
            var _local_2:int;
            var _local_3:IWindowContainer;
            var _local_6:IWindow;
            var _local_7:IssueBundle;
            var _local_9:IWindow;
            var _local_10:_Str_2484;
            var _local_11:IBitmapWrapperWindow;
            var _local_12:String;
            var _local_13:BitmapDataAsset;
            var _local_14:BitmapData;
            if (this._list == null)
            {
                return;
            }
            if (((k == null) || (k.length == 0)))
            {
                this._list.destroyListItems();
                return;
            }
            k.sortOn(["highestPriority", "issueAgeInMilliseconds"], [Array.NUMERIC, Array.NUMERIC]);
            var _local_4:int = this._list.numListItems;
            var _local_5:int = k.length;
            if (_local_5 > this._issueListLimit)
            {
                _local_5 = this._issueListLimit;
            }
            if (_local_4 < _local_5)
            {
                _local_2 = 0;
                while (_local_2 < (_local_5 - _local_4))
                {
                    _local_3 = (this._listItem.clone() as IWindowContainer);
                    this._list.addListItem(_local_3);
                    _local_2++;
                }
            }
            else
            {
                if (_local_4 > _local_5)
                {
                    _local_2 = 0;
                    while (_local_2 < (_local_4 - _local_5))
                    {
                        _local_9 = this._list.removeListItemAt(0);
                        _local_9.dispose();
                        _local_2++;
                    }
                }
            }
            _local_2 = 1;
            var _local_8:int = getTimer();
            for each (_local_7 in k)
            {
                if (_local_2 > this._issueListLimit) break;
                if (((_local_7 == null) || (this._listItem == null)))
                {
                    return;
                }
                _local_3 = (this._list.getListItemAt((_local_2 - 1)) as IWindowContainer);
                if (_local_3 == null)
                {
                    return;
                }
                _local_3.width = this._list.width;
                _local_3.color = ((_local_2++ % 2) ? 4289914618 : 0xFFFFFFFF);
                _local_6 = _local_3.findChildByName("score");
                if (_local_6 != null)
                {
                    _local_6.caption = _local_7.highestPriority.toString();
                }
                _local_10 = _local_7._Str_5216();
                if (_local_10 == null)
                {
                    return;
                }
                _local_6 = _local_3.findChildByName("source");
                if (_local_6 != null)
                {
                    _local_6.caption = IssueCategoryNames._Str_21676(_local_10._Str_2712);
                }
                _local_6 = _local_3.findChildByName("category");
                if (_local_6 != null)
                {
                    _local_6.caption = IssueCategoryNames._Str_21569(_local_10._Str_7437);
                }
                _local_6 = _local_3.findChildByName("target_name");
                if (_local_6 != null)
                {
                    if (_local_10._Str_2662 != 0)
                    {
                        _local_6.caption = _local_10._Str_5842;
                    }
                    else
                    {
                        _local_6.caption = "";
                    }
                }
                _local_11 = (_local_3.findChildByName("target_icon") as IBitmapWrapperWindow);
                if (_local_11 != null)
                {
                    _local_12 = ((_local_10._Str_2662) ? "user_icon_png" : "room_icon_png");
                    _local_13 = (this._issueBrowser.assets.getAssetByName(_local_12) as BitmapDataAsset);
                    if (((!(_local_13 == null)) && (!((_local_13.content as BitmapData) == null))))
                    {
                        _local_14 = (_local_13.content as BitmapData);
                        if (_local_14 != null)
                        {
                            _local_11.bitmap = _local_14.clone();
                        }
                    }
                }
                _local_6 = _local_3.findChildByName("time");
                if (_local_6 != null)
                {
                    _local_6.caption = _local_7._Str_15885(_local_8);
                }
                _local_6 = _local_3.findChildByName("msgs");
                if (_local_6 != null)
                {
                    _local_6.caption = _local_7._Str_23420().toString();
                }
                _local_6 = _local_3.findChildByName("picker");
                if (_local_6 != null)
                {
                    _local_6.caption = _local_7._Str_25343;
                }
                _local_6 = _local_3.findChildByName("pick_button");
                if (_local_6 != null)
                {
                    _local_6.id = _local_7.id;
                    _local_6.removeEventListener(WindowMouseEvent.CLICK, this._Str_19129);
                    _local_6.addEventListener(WindowMouseEvent.CLICK, this._Str_19129);
                }
                _local_6 = _local_3.findChildByName("handle_button");
                if (_local_6 != null)
                {
                    _local_6.id = _local_7.id;
                    _local_6.removeEventListener(WindowMouseEvent.CLICK, this._Str_20641);
                    _local_6.addEventListener(WindowMouseEvent.CLICK, this._Str_20641);
                }
                _local_6 = _local_3.findChildByName("release_button");
                if (_local_6 != null)
                {
                    _local_6.id = _local_7.id;
                    _local_6.removeEventListener(WindowMouseEvent.CLICK, this._Str_15257);
                    _local_6.addEventListener(WindowMouseEvent.CLICK, this._Str_15257);
                }
            }
        }

        private function _Str_19129(k:WindowMouseEvent):void
        {
            if (this._issueManager == null)
            {
                return;
            }
            this._issueManager._Str_21541(k.window.id, "pick button");
        }

        private function _Str_20641(k:WindowMouseEvent):void
        {
            if (this._issueBrowser == null)
            {
                return;
            }
            this._issueManager._Str_16335(k.window.id);
        }

        private function _Str_15257(k:WindowMouseEvent):void
        {
            if (this._issueManager == null)
            {
                return;
            }
            this._issueManager._Str_17732(k.window.id);
        }
    }
}

