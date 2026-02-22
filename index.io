<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>语闻的摄影主页 · 彩色毛玻璃 · 箭头翻页版</title>
    <!-- Font Awesome 5 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- 苹果风格字体 Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,400;14..32,500;14..32,600;14..32,700&display=swap" rel="stylesheet">
    <style>
        /* ----- 重置与彩色流动背景 ----- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
            background: linear-gradient(125deg, #f9c5d1, #b8e1ff, #d4bff9, #a1e3d8, #ffe7b6);
            background-size: 400% 400%;
            animation: gradientFlow 20s ease infinite;
            overflow-x: hidden;
        }
        @keyframes gradientFlow {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        /* 主容器：磨砂玻璃效果 */
        .glass-stage {
            width: 100%;
            max-width: 1100px;
            background: rgba(255, 255, 255, 0.28);
            backdrop-filter: blur(35px) saturate(190%);
            -webkit-backdrop-filter: blur(35px) saturate(190%);
            border-radius: 4rem;
            box-shadow: 0 30px 60px -20px rgba(0, 30, 40, 0.35), 0 0 0 1px rgba(255, 255, 255, 0.6) inset;
            padding: 2.5rem 1.5rem;
            margin: 0 auto;
        }
        /* 标题区 */
        .greeting-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }
        .greeting-header h1 {
            font-size: clamp(1.8rem, 5vw, 2.6rem);
            font-weight: 700;
            background: linear-gradient(145deg, #1f2d3f, #283b4c);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            display: inline-flex;
            align-items: center;
            gap: 0.8rem;
            margin-bottom: 0.8rem;
        }
        .greeting-header h1 i {
            background: rgba(255,255,255,0.5);
            padding: 0.5rem;
            border-radius: 50%;
            color: #2c4e66;
            box-shadow: 0 4px 8px rgba(0,0,0,0.08);
        }
        .greeting-header .sub {
            font-size: clamp(0.95rem, 3vw, 1.2rem);
            background: rgba(255,255,255,0.4);
            backdrop-filter: blur(8px);
            padding: 0.6rem 2.2rem;
            border-radius: 60px;
            display: inline-block;
            border: 1px solid rgba(255,255,255,0.8);
            color: #1e364a;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        /* 轮播容器 */
        .carousel-area {
            position: relative;
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
            padding: 0 0.5rem;
        }
        /* 卡片容器：禁用滚动，固定居中 */
        .cards-scroll {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            overflow: hidden;
            padding: 1rem 0 2rem;
            position: relative;
            height: 520px;
        }
        /* 卡片：基础样式，默认隐藏，仅当前显示 */
        .card {
            flex: 0 0 clamp(75%, 80vw, 420px);
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(25px);
            -webkit-backdrop-filter: blur(25px);
            border: 2px solid rgba(255, 255, 255, 0.9);
            border-radius: 3rem;
            padding: 2.2rem 2rem;
            box-shadow: 0 25px 45px -16px rgba(0, 30, 40, 0.2), 0 0 0 1px rgba(255,255,255,0.7) inset;
            color: #1b2b38;
            min-height: 480px;
            display: flex;
            flex-direction: column;
            will-change: transform, opacity;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%) scale(0.95);
            opacity: 0;
            pointer-events: none;
            transition: all 0.5s cubic-bezier(0.2, 0.9, 0.3, 1.3);
        }
        /* 激活的卡片：居中显示，完全可见 */
        .card.active {
            transform: translate(-50%, -50%) scale(1);
            opacity: 1;
            pointer-events: all;
            box-shadow: 0 35px 60px -20px rgba(0, 30, 50, 0.45), 0 0 0 1px rgba(255,255,255,0.8) inset;
        }
        /* 卡片内标题 */
        .card h2 {
            font-size: clamp(1.6rem, 4vw, 2.2rem);
            font-weight: 600;
            margin-bottom: 1.8rem;
            display: flex;
            align-items: center;
            gap: 0.8rem;
            border-bottom: 2px solid rgba(65, 105, 135, 0.25);
            padding-bottom: 0.8rem;
        }
        .card h2 i {
            color: #2f5e7a;
            font-size: clamp(1.5rem, 3vw, 2rem);
        }
        .card-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
            font-size: 1.05rem;
        }
        /* 欢迎卡片专属 */
        .avatar-large {
            display: flex;
            justify-content: center;
            margin: 1rem 0;
        }
        .avatar-circle {
            width: clamp(100px, 25vw, 130px);
            height: clamp(100px, 25vw, 130px);
            background: linear-gradient(135deg, #88a9bf, #50748e);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 4px solid white;
            box-shadow: 0 15px 25px -8px rgba(0,0,0,0.25);
            font-size: clamp(3rem, 8vw, 4.2rem);
            color: white;
        }
        .welcome-nick {
            text-align: center;
            font-size: clamp(1.4rem, 4vw, 1.8rem);
            font-weight: 600;
            margin: 0.5rem 0 0.3rem;
        }
        .welcome-desc {
            text-align: center;
            background: rgba(200, 220, 240, 0.6);
            padding: 0.9rem 1.2rem;
            border-radius: 50px;
            font-weight: 500;
            border: 1px solid rgba(255,255,255,0.7);
        }
        /* 技能/风格标签 */
        .skill-pills {
            display: flex;
            flex-wrap: wrap;
            gap: 0.8rem;
        }
        .skill-pill {
            background: rgba(60, 100, 130, 0.2);
            padding: 0.7rem 1.5rem;
            border-radius: 40px;
            font-size: 1rem;
            font-weight: 500;
            border: 1px solid rgba(255,255,255,0.8);
            backdrop-filter: blur(5px);
            transition: all 0.2s ease;
        }
        .skill-pill:hover {
            background: rgba(60, 100, 130, 0.28);
            transform: translateY(-2px);
        }
        .skill-pill i {
            margin-right: 0.4rem;
            color: #2a5f7a;
        }
        /* 经历/合作条目 */
        .exp-row {
            display: flex;
            gap: 1.2rem;
            margin-bottom: 1.6rem;
            align-items: center;
            transition: all 0.2s ease;
        }
        .exp-row:hover {
            transform: translateX(4px);
        }
        .exp-icon {
            width: 48px;
            height: 48px;
            background: white;
            border-radius: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #2c607c;
            font-size: 1.4rem;
            box-shadow: 0 6px 12px rgba(0,0,0,0.08);
            border: 1px solid rgba(255,255,255,0.9);
        }
        .exp-text h3 {
            font-size: 1.15rem;
            font-weight: 600;
        }
        .exp-text p {
            color: #38586e;
            font-size: 0.95rem;
            margin-top: 0.2rem;
        }
        /* 联系方式 */
        .contact-block {
            display: flex;
            flex-direction: column;
            gap: 1.2rem;
            margin-top: 0.5rem;
        }
        .contact-line {
            display: flex;
            align-items: center;
            gap: 1rem;
            background: rgba(255,255,255,0.5);
            padding: 0.9rem 1.6rem;
            border-radius: 60px;
            border: 1px solid rgba(255,255,255,0.9);
            font-size: 1rem;
            transition: all 0.2s ease;
        }
        .contact-line:hover {
            background: white;
            transform: translateY(-3px);
            box-shadow: 0 8px 15px rgba(0,0,0,0.08);
        }
        .contact-line i {
            width: 2rem;
            font-size: 1.4rem;
            color: #1f5575;
        }
        /* 箭头导航 */
        .nav-arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: clamp(44px, 10vw, 56px);
            height: clamp(44px, 10vw, 56px);
            background: rgba(255,255,255,0.7);
            backdrop-filter: blur(20px);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: clamp(1.5rem, 4vw, 2.2rem);
            color: #1b3b4f;
            box-shadow: 0 12px 25px -8px rgba(0, 30, 40, 0.35);
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.2, 0.9, 0.3, 1.3);
            z-index: 20;
            border: 2px solid rgba(255,255,255,0.9);
        }
        .nav-arrow:hover {
            background: white;
            transform: translateY(-50%) scale(1.15);
            box-shadow: 0 18px 30px -10px rgba(0, 40, 60, 0.4);
        }
        .nav-arrow.disabled {
            opacity: 0.2;
            pointer-events: none;
            transform: translateY(-50%) scale(0.9);
        }
        .arrow-left { left: -10px; }
        .arrow-right { right: -10px; }
        @media (min-width: 720px) {
            .arrow-left { left: -20px; }
            .arrow-right { right: -20px; }
        }
        /* 点指示器 */
        .dot-indicators {
            display: flex;
            justify-content: center;
            gap: 1rem;
            padding: 0.8rem 0;
        }
        .dot {
            width: 12px;
            height: 12px;
            background: rgba(40, 60, 80, 0.25);
            border-radius: 30px;
            transition: all 0.3s cubic-bezier(0.2, 0.9, 0.3, 1.2);
            cursor: pointer;
            border: 1px solid rgba(255,255,255,0.7);
        }
        .dot.active {
            width: 40px;
            background: #2b627f;
            border-color: white;
            box-shadow: 0 0 0 3px rgba(255,255,255,0.8), 0 3px 8px rgba(0,0,0,0.1);
        }
        .dot:hover {
            background: #507e9c;
            transform: scale(1.4);
        }
        /* 卡片装饰 */
        .quote-note {
            background: rgba(200,220,235,0.4);
            border-radius: 2rem;
            padding: 1.4rem 1.2rem;
            font-style: italic;
            border-left: 4px solid #608aa5;
            margin-top: 0.5rem;
            line-height: 1.5;
        }
        /* 小屏适配 */
        @media (max-width: 480px) {
            .glass-stage {
                padding: 2rem 1rem;
                border-radius: 3rem;
            }
            .cards-scroll {
                height: 460px;
            }
            .card {
                padding: 1.8rem 1.5rem;
                min-height: 420px;
            }
            .exp-icon {
                width: 42px;
                height: 42px;
                font-size: 1.2rem;
            }
            .contact-line {
                padding: 0.8rem 1.2rem;
                font-size: 0.95rem;
            }
        }
    </style>
</head>
<body>
    <div class="glass-stage">
        <div class="greeting-header">
            <h1>
                <i class="fas fa-camera"></i> 欢迎来到我的主页
                <i class="fas fa-sun" style="color:#f5b841;"></i>
            </h1>
            <div class="sub">
                <i class="fas fa-hand-peace"></i> 挺帅的一个人 · 定格光影瞬间 · 徐州摄影
            </div>
        </div>
        <div class="carousel-area">
            <div class="nav-arrow arrow-left" id="prevArrow"><i class="fas fa-chevron-left"></i></div>
            <div class="nav-arrow arrow-right" id="nextArrow"><i class="fas fa-chevron-right"></i></div>
            <div class="cards-scroll" id="cardsScroll">
                <!-- 卡片 1：欢迎 -->
                <div class="card active" data-index="0">
                    <h2><i class="fas fa-star"></i> 欢迎</h2>
                    <div class="card-content">
                        <div class="avatar-large">
                            <div class="avatar-circle"><i class="fas fa-camera-retro"></i></div>
                        </div>
                        <div class="welcome-nick">Hi,我是语闻 😋</div>
                  
                        <div class="quote-note"><i class="fas fa-quote-left"></i> 海内存知己，天涯若比邻。</div>
                    </div>
                </div>
                <!-- 卡片 2：关于 -->
                <div class="card" data-index="1">
                    <h2><i class="fas fa-user-circle"></i> 关于</h2>
                    <div class="card-content">
                        <p><i class="fas fa-briefcase" style="color:#2d607c;"></i> <strong>入行：</strong> 2023年开始摄影创作</p>
                        <p><i class="fas fa-map-pin"></i> <strong>拍摄范围：</strong> 徐州市区内</p>
                        <p><i class="fas fa-heart" style="color:#b76e7a;"></i> <strong>专注：</strong> 人物摄影，风光摄影</p>
                        <div style="margin-top: 1rem; background: rgba(255,255,240,0.6); border-radius: 2rem; padding: 1.2rem; text-align: center; border:1px solid rgba(255,255,255,0.7);">✦ 以镜为媒，定格徐州的光影与人间 ✦</div>
                    </div>
                </div>
                <!-- 卡片 3：擅长风格 -->
                <div class="card" data-index="2">
                    <h2><i class="fas fa-palette"></i> 擅长风格</h2>
                    <div class="card-content">
                        <div class="skill-pills">
                            <span class="skill-pill"><i class="fas fa-user"></i> 人像</span>
                            <span class="skill-pill"><i class="fas fa-tree"></i> 风光</span>
                            <span class="skill-pill"><i class="fas fa-search"></i> 特写</span>
                            <span class="skill-pill"><i class="fas fa-film"></i> 运镜</span>
                            
                        </div>
                        <p style="margin-top: 1rem; font-weight:500;"><i class="fas fa-magic" style="color:#2f5e7a;"></i> 全能摄影，用心捕捉每一个美好瞬间。</p>
                    </div>
                </div>
                <!-- 卡片 4：合作与经历 -->
                <div class="card" data-index="3">
                    <h2><i class="fas fa-handshake"></i> 摄影经历</h2>
                    <div class="card-content">
                        <div class="exp-row"><div class="exp-icon"><i class="fas fa-image"></i></div><div class="exp-text"><h3>图虫签约摄影师</h3><p>官方认证签约</p></div></div>
                        <div class="exp-row"><div class="exp-icon"><i class="fas fa-id-card"></i></div><div class="exp-text"><h3>中国摄影师协会会员</h3><p>协会认证会员</p></div></div>
                        <div class="exp-row"><div class="exp-icon"><i class="fas fa-lightbulb"></i></div><div class="exp-text"><h3>光影中国会员</h3><p>光影中国创作社群</p></div></div>
                    </div>
                </div>
                <!-- 卡片 5：约拍与联系 -->
                <div class="card" data-index="4">
                    <h2><i class="fas fa-paper-plane"></i> 联系我</h2>
                    <div class="card-content">
                        <p style="font-weight:500;">在哪里找到我？</p>
                        <div class="contact-block">
                            <div class="contact-line"><i class="fas fa-envelope"></i> <span>3292964536@qq.com</span></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="dot-indicators" id="dotContainer">
                <span class="dot active" data-index="0"></span>
                <span class="dot" data-index="1"></span>
                <span class="dot" data-index="2"></span>
                <span class="dot" data-index="3"></span>
                <span class="dot" data-index="4"></span>
            </div>
        </div>
    </div>
    <script>
        (function() {
            // 获取元素
            const cards = document.querySelectorAll('.card');
            const prevBtn = document.getElementById('prevArrow');
            const nextBtn = document.getElementById('nextArrow');
            const dots = document.querySelectorAll('.dot');
            const cardCount = cards.length;
            let currentIndex = 0;
            let isSwitching = false; // 防止快速连续点击

            // 切换到指定索引的卡片
            function switchToIndex(index) {
                // 边界判断+防重复点击
                if (index < 0 || index >= cardCount || isSwitching || index === currentIndex) return;
                isSwitching = true;

                // 移除当前卡片激活状态，添加新卡片激活状态
                cards[currentIndex].classList.remove('active');
dots[currentIndex].classList.remove('active')；
cards[index].classList.add('active')；
dots[index].classList.add('active')；

// 更新当前索引
currentIndex=索引；
// 更新箭头禁用状态
updateArrowsStatus()；
// 解锁点击
setTimeout(()=>isSwitching=false，500)；
            }

// 更新箭头禁用/启用状态
函数updateArrowsStatus(){
prevBtn.classList.Toggle('disabled'，currentIndex====0)；
nextBtn.classList.toggle('disabled'，currentIndex===卡计数-1)；
            }

// 事件绑定：箭头点击
prevBtn.AddEventListener('click'，()=>switchToIndex(currentIndex-1))；
nextBtn.addEventListener('click'，()=>switchToIndex(currentIndex+1))；

// 事件绑定：指示器点击
dots.forEach((dot，idx)=>{
点。addEventListener('click'，()=>switchToIndex(idx))；
            });

// 初始化箭头状态
updateArrowsStatus()；

// 页面加载初始动画
setTimeout(()=>{
cards[0].style.transition='所有0.8s轻松'；
cards[0].style.opacity=1；
卡[0].style.transform='转换(-50%，-50%)比例(1)'；
}, 100);
        })();
</script>
</body>
</html>
