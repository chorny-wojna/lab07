//
//  Shader.fsh
//  TPLab07_2
//
//  Created by Admin on 06.05.17.
//  Copyright © 2017 ParnasusIndustries. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
