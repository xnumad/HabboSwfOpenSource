package com.sulake.habbo.moderation
{
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITabButtonWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.core.assets.XmlAsset;

    public class IssueBrowser 
    {
        private const _Str_23545:String = "my_issues";
        private const _Str_25166:String = "open_issues";
        private const _Str_23557:String = "picked_issues";
        private const _Str_26068:String = "closed_issues";

        private var _issueManager:IssueManager;
        private var _windowManager:IHabboWindowManager;
        private var _assets:IAssetLibrary;
        private var _window:IFrameWindow;
        private var _tabContext:ITabContextWindow;
        private var _selectedView:IIssueBrowserView;
        private var _myIssuesView:IIssueBrowserView;
        private var _openIssuesView:IIssueBrowserView;
        private var _pickedIssuesView:PickedIssuesView;

        public function IssueBrowser(k:IssueManager, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary)
        {
            this._issueManager = k;
            this._windowManager = _arg_2;
            this._assets = _arg_3;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get assets():IAssetLibrary
        {
            return this._assets;
        }

        public function get _Str_2880():IssueManager
        {
            return this._issueManager;
        }

        public function show():void
        {
            if (this._window == null)
            {
                this._Str_25703();
            }
            this._window.visible = true;
            this._window.activate();
            this.update();
        }

        public function isOpen():Boolean
        {
            return (!(this._window == null)) && (this._window.visible);
        }

        private function _Str_25703():void
        {
            var _local_2:IWindow;
            var _local_3:IWindow;
            var _local_4:IWindow;
            var _local_5:ITabButtonWindow;
            var _local_6:int;
            if (this._window == null)
            {
                this._window = (this.createWindow("issue_browser_xml") as IFrameWindow);
                if (this._window == null)
                {
                    return;
                }
                _local_2 = this._window.desktop;
                this._window.x = ((_local_2.width / 2) - (this._window.width / 2));
                this._window.y = ((_local_2.height / 2) - (this._window.height / 2));
                _local_3 = this._window.findChildByTag("close");
                if (_local_3 != null)
                {
                    _local_3.addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
                }
                _local_4 = this._window.findChildByName("auto_pick");
                if (_local_4 != null)
                {
                    _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_25081);
                }
                this._tabContext = (this._window.findChildByName("tab_context") as ITabContextWindow);
                _local_6 = 0;
                while (_local_6 < this._tabContext._Str_4277)
                {
                    _local_5 = this._tabContext._Str_3363(_local_6);
                    _local_5.addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_18079);
                    _local_6++;
                }
                this._myIssuesView = new MyIssuesView(this._Str_2880, this, (this._window.findChildByName("my_issues_prototype") as IWindowContainer));
                this._openIssuesView = new OpenIssuesView(this._Str_2880, this, (this._window.findChildByName("open_issues_prototype") as IWindowContainer));
                this._pickedIssuesView = new PickedIssuesView(this._Str_2880, this, (this._window.findChildByName("picked_issues_prototype") as IWindowContainer));
            }
            this._tabContext = (this._window.findChildByName("tab_context") as ITabContextWindow);
            if (((this._tabContext == null) || (this._tabContext.container == null)))
            {
                return;
            }
            var k:ISelectableWindow = this._tabContext.selector.getSelectableByName("open_issues");
            this._tabContext.selector.setSelected(k);
        }

        private function _Str_3734(k:String):void
        {
            var _local_2:IIssueBrowserView = this._Str_9043(k);
            if (this._selectedView == _local_2)
            {
                return;
            }
            if (this._selectedView != null)
            {
                this._selectedView.visible = false;
            }
            this._selectedView = _local_2;
            if (this._selectedView == null)
            {
                return;
            }
            this._selectedView.view.width = this._tabContext.container.width;
            this._selectedView.view.height = this._tabContext.container.height;
            this._selectedView.visible = true;
            this._selectedView.update();
        }

        private function _Str_9043(k:String):IIssueBrowserView
        {
            switch (k)
            {
                case this._Str_23545:
                    return this._myIssuesView;
                case this._Str_25166:
                    return this._openIssuesView;
                case this._Str_23557:
                    return this._pickedIssuesView;
                default:
                    return null;
            }
        }

        private function _Str_18079(k:WindowEvent):void
        {
            if (((k == null) || (k.window == null)))
            {
                return;
            }
            this._Str_3734(k.window.name);
        }

        public function update():void
        {
            if (((this._window == null) || (!(this._window.visible))))
            {
                return;
            }
            if (this._selectedView == null)
            {
                return;
            }
            this._selectedView.update();
        }

        public function createWindow(k:String):IWindow
        {
            if (((this._windowManager == null) || (this._assets == null)))
            {
                return null;
            }
            var _local_2:XmlAsset = (this._assets.getAssetByName(k) as XmlAsset);
            if (((_local_2 == null) || (_local_2.content == null)))
            {
                return null;
            }
            return this._windowManager.buildFromXML((_local_2.content as XML));
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            this._window.visible = false;
        }

        private function _Str_25081(k:WindowMouseEvent):void
        {
            if (this._issueManager != null)
            {
                this._issueManager._Str_15446("issue browser pick next");
            }
        }
    }
}
