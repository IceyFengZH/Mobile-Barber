//
//  ViewController.swift
//  Piano
//
//  Created by 温广哲 on 2021/6/3.
//

import UIKit

// 播放音乐 视频 库
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 需要一个播放器
    var musicPlayer: AVAudioPlayer!
    // Tips: 按住option健 鼠标变成？点击查阅文档
    
    // 播放音乐的函数
    func playSound(soundName: String) {
        // bundle 是从本地资源中 访问 »把资源制成url main是指当前目录下
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        // 通过url作为内容播放音乐的对象
        // 异常处理 和。强制解包 不妥其实 ！是option 可能是nil
        musicPlayer = try! AVAudioPlayer(contentsOf: url!)
        // 对象的播放功能
        musicPlayer.play()
    }
    @IBAction func platMusicButtonTapped(_ sender: UIButton) {
        // 1 先从story board 按住右键/左键+command 拖拽到 viewController
        // 2 再从controller里行号上的 + 号依此拖拽到story component上
        //   实现一个函数 控制多个控件
        
        // play
        playSound(soundName: sender.currentTitle!)
    }
    

}

