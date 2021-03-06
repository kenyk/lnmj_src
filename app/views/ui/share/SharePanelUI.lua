--region *.lua
--Date
--此文件由[BabeLua]插件自动生成



--endregion

local SharePanelUI = class("SharePanelUI", cc.load("mvc").UIBase)

SharePanelUI.RESOURCE_FILENAME = "uiShare/UI_Share_Panel.csb"

function SharePanelUI:onCreate()
    self:setInOutAction()
    self.closeBtn = helper.findNodeByName(self.resourceNode_,"closeBtn")
    self.closeBtn:setPressedActionEnabled(true)
    self.weixinBtn = helper.findNodeByName(self.resourceNode_,"btn_share_weixin")
    self.weixinBtn:setPressedActionEnabled(true)
    self.weixincircleBtn = helper.findNodeByName(self.resourceNode_,"btn_share_weixincircle")
    self.weixincircleBtn:setPressedActionEnabled(true)
    local weburl = "https://acz5fi.mlinks.cc/A0j5?".."roomId=".."_"..1    
    if UserData.isActivation == true then
        self.args = {title="一起来玩么么岭南麻将吧！",desc="邀请您加入【么么岭南麻将】，下载完后，输入激活码:"..UserData.uid.."进行激活游戏!",webUrl=weburl,imageUrl=""}
    else
        self.args = {title="一起来玩么么岭南麻将吧！",desc="邀请您加入【么么岭南麻将】，下载完后，输入激活码:"..UserData.userInfo.activationCode.."进行激活游戏!",webUrl=weburl,imageUrl=""}
        --self.args = {title="一起来玩么么岭南麻将吧！",desc="邀请您加入【么么岭南麻将】，点击该链接，进入下载页面，下载游戏！",webUrl=weburl,imageUrl=""}
    end
end

function SharePanelUI:onShareWeixin()
	LuaCallPlatformFun.share(self.args)
end

function SharePanelUI:onShareWeixinCircle()
	LuaCallPlatformFun.shareToCircle(self.args)
end

function SharePanelUI:onCloseBtnClick()
	self:close()
end

return SharePanelUI