//
//  GetMainColorFromImageViewController.m
//  Helloworld
//
//  Created by zhiyunyu on 2020/1/10.
//  Copyright © 2020 zhiyunyu. All rights reserved.
//

#import "GetMainColorFromImageViewController.h"
#import "GetAlbumPictureViewController.h"
#import "UIView+Utils.h"


@interface GetMainColorFromImageViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property(nonatomic, strong) UIImageView *avatarImageView;
@end

@implementation GetMainColorFromImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    self.avatarImageView = ({
        CGFloat imageViewSize = 300;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - imageViewSize) / 2, 100, imageViewSize, imageViewSize)];
        imageView.backgroundColor = [UIColor blueColor];
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"pikaqiu" ofType:@"png" inDirectory:@"Image.bundle/home"];
        imageView.image = [UIImage imageWithContentsOfFile:imagePath];
        imageView;
    });
    [self.view addSubview:self.avatarImageView];

    //打开用户交互
    self.avatarImageView.userInteractionEnabled = YES;
    //初始化一个手势
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(avatarDidTapped:)];
    //为图片添加手势
    [self.avatarImageView addGestureRecognizer:singleTap];

}

#pragma mark - Private


// 保存图片到相册的回调函数
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error) {
        NSLog(@"保存失败");
    } else {
        NSLog(@"保存成功");
    }
}


//头像点击事件
- (void)avatarDidTapped:(UIGestureRecognizer *) gestureRecognizer {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.allowsEditing = YES;
    picker.delegate = self;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改头像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"我的相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;//我的相片 （这种形式会把一张张照片罗列出来）
        [self presentViewController:picker animated:YES completion:nil];
    }];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:nil];
    }];
    UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:cancelAction];
    [alertController addAction:sureAction];
    [alertController addAction:destructiveAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark UINavigationControllerDelegate, UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([mediaType isEqual:@"public.image"]) {
        UIImage *originImage =
        [info objectForKey:UIImagePickerControllerOriginalImage];
        self.avatarImageView.image = originImage;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([UIDevice currentDevice].systemVersion.floatValue < 11) {
        return;
    }
    if ([viewController isKindOfClass:NSClassFromString(@"PUPhotoPickerHostViewController")]) {
        [viewController.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.frame.size.width < 42) {
                [viewController.view sendSubviewToBack:obj];
                *stop = YES;
            }
        }];
    }
}

@end