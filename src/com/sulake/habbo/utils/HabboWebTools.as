package com.sulake.habbo.utils
{
    import flash.external.ExternalInterface;
    import flash.net.URLRequest;
    import flash.net.navigateToURL;

    public class HabboWebTools 
    {
        public static const ADVERTISEMENT:String = "advertisement";
        public static const OPENLINK:String = "openlink";
        public static const OPENROOM:String = "openroom";
        private static var _isSpaWeb:Boolean = false;

        public static function set isSpaWeb(isSpaWeb:Boolean):void
        {
            _isSpaWeb = isSpaWeb;
        }

        public static function logEventLog(data:String):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.logEventLog", data);
                }
            }
            catch(e:Error)
            {
                Logger.log("External interface not working, failed to log event log.");
            }
        }

        public static function openWebPage(url:String, targetWindow:String=""):void
        {
            var strUserAgent:String;
            if (((targetWindow == null) || (targetWindow == "")))
            {
                targetWindow = ADVERTISEMENT;
            }
            var req:URLRequest = new URLRequest(url);
            if (!ExternalInterface.available)
            {
                flash.net.navigateToURL(req, targetWindow);
            }
            else
            {
                try
                {
                    strUserAgent = String(ExternalInterface.call("function() {return navigator.userAgent;}")).toLowerCase();
                    if (strUserAgent.indexOf("firefox") >= 0)
                    {
                        ExternalInterface.call("window.open", req.url, targetWindow);
                    }
                    else
                    {
                        if (strUserAgent.indexOf("msie") >= 0)
                        {
                            ExternalInterface.call((((("function setWMWindow() {window.open('" + req.url) + "', '") + targetWindow) + "');}"));
                        }
                        else
                        {
                            flash.net.navigateToURL(req, targetWindow);
                        }
                    }
                }
                catch(e:Error)
                {
                    Logger.log("External interface not working, failed to open web page.");
                }
            }
        }

        public static function openPage(pageUrl:String):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.openPage", pageUrl);
                }
                else
                {
                    Logger.log("External interface not available, openPage failed.");
                }
            }
            catch(e:Error)
            {
                Logger.log(("Failed to open web page " + pageUrl));
            }
        }

        public static function sendHeartBeat():void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.heartBeat");
                }
            }
            catch(e:Error)
            {
            }
        }

        public static function openWebPageAndMinimizeClient(pageUrl:String):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    if (_isSpaWeb)
                    {
                        openPage(pageUrl);
                    }
                    else
                    {
                        ExternalInterface.call("FlashExternalInterface.openWebPageAndMinimizeClient", pageUrl);
                    }
                }
            }
            catch(e:Error)
            {
                Logger.log(("Failed to open web page " + pageUrl));
            }
        }

        public static function closeWebPageAndRestoreClient():void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.closeWebPageAndRestoreClient");
                }
            }
            catch(e:Error)
            {
                Logger.log("Failed to close web page and restore client!");
            }
        }

        public static function openHabblet(name:String, param:String=null):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.openHabblet", name, param);
                }
            }
            catch(e:Error)
            {
                Logger.log(("Failed to open Habblet " + name));
            }
        }

        public static function closeHabblet(name:String, param:String=null):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.closeHabblet", name, param);
                }
            }
            catch(e:Error)
            {
                Logger.log(("Failed to close Habblet " + name));
            }
        }

        public static function send(reasonCode:int, reasonString:String):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.disconnect", reasonCode, reasonString);
                }
            }
            catch(e:Error)
            {
                Logger.log("Failed to close send ");
            }
        }

        public static function showGame(gameUrl:String):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalGameInterface.showGame", gameUrl);
                }
            }
            catch(e:Error)
            {
                Logger.log(("Failed to open game: " + e));
            }
        }

        public static function hideGame():void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalGameInterface.hideGame");
                }
            }
            catch(e:Error)
            {
                Logger.log("Failed to hide game");
            }
        }

        public static function navigateToURL(k:String, _arg_2:String=null):void
        {
            var _local_3:URLRequest = new URLRequest(k);
            flash.net.navigateToURL(_local_3, _arg_2);
        }

        public static function open(url:String):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.openExternalLink", escape(url));
                }
                else
                {
                    Logger.log(("External interface not available. Could not request to open: " + url));
                }
            }
            catch(e:Error)
            {
                Logger.log(("External interface not working. Could not request to open: " + url));
            }
        }

        public static function roomVisited(roomId:int):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.roomVisited", roomId);
                }
                else
                {
                    Logger.log("External interface not available. Could not store last room visit.");
                }
            }
            catch(e:Error)
            {
                Logger.log("External interface not working. Could not store last room visit.");
            }
        }

        public static function openMinimail(target:String):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    if (_isSpaWeb)
                    {
                        ExternalInterface.call("FlashExternalInterface.openMinimail", target);
                    }
                    else
                    {
                        openHabblet("minimail", target);
                    }
                }
                else
                {
                    Logger.log("External interface not available. Could not open minimail.");
                }
            }
            catch(e:Error)
            {
                Logger.log("External interface not working. Could not open minimail.");
            }
        }

        public static function openNews():void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    if (_isSpaWeb)
                    {
                        ExternalInterface.call("FlashExternalInterface.openNews");
                    }
                    else
                    {
                        openHabblet("news");
                    }
                }
                else
                {
                    Logger.log("External interface not available. Could not open news.");
                }
            }
            catch(e:Error)
            {
                Logger.log("External interface not working. Could not open news.");
            }
        }

        public static function closeNews():void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    if (_isSpaWeb)
                    {
                        ExternalInterface.call("FlashExternalInterface.closeNews");
                    }
                    else
                    {
                        closeHabblet("news");
                    }
                }
                else
                {
                    Logger.log("External interface not available. Could not close news.");
                }
            }
            catch(e:Error)
            {
                Logger.log("External interface not working. Could not close news.");
            }
        }

        public static function openAvatars():void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    if (_isSpaWeb)
                    {
                        ExternalInterface.call("FlashExternalInterface.openAvatars");
                    }
                    else
                    {
                        openHabblet("avatars");
                    }
                }
                else
                {
                    Logger.log("External interface not available. Could not open avatars.");
                }
            }
            catch(e:Error)
            {
                Logger.log("External interface not working. Could not open avatars.");
            }
        }

        public static function openRoomEnterAd():void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    if (_isSpaWeb)
                    {
                        ExternalInterface.call("FlashExternalInterface.openRoomEnterAd");
                    }
                    else
                    {
                        openHabblet("roomenterad", "");
                    }
                }
                else
                {
                    Logger.log("External interface not available. Could not open roomenterad.");
                }
            }
            catch(e:Error)
            {
                Logger.log("External interface not working. Could not open roomenterad.");
            }
        }

        public static function updateFigure(figure:String):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    if (_isSpaWeb)
                    {
                        ExternalInterface.call("FlashExternalInterface.updateFigure", figure);
                    }
                }
                else
                {
                    Logger.log("External interface not available. Could not update figure.");
                }
            }
            catch(e:Error)
            {
                Logger.log("External interface not working. Could not update figure.");
            }
        }
    }
}
