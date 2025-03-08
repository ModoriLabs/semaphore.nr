//SPDX-License-Identifier: MIT
pragma solidity >=0.8.23 <=0.8.28;

import {Honk} from "../interfaces/HonkVerificationKey.sol";
import {console} from "forge-std/console.sol";

contract HonkVerificationKeys {
    // TOOD:
    // mapping(uint256 => address) public verificationKeys;

    constructor() {}

    function loadVerificationKey(uint256 treeDepth) external pure returns (Honk.VerificationKey memory) {
        Honk.VerificationKey memory vk;
        if (treeDepth == 1) {
            vk = Honk.VerificationKey({
                circuitSize: uint256(16384),
                logCircuitSize: uint256(14),
                publicInputsSize: uint256(4),
                ql: Honk.G1Point({
                    x: uint256(0x0b8c1d2208a4434bfb711b0059aa9835349648737ce4a5c5db564c339874094a),
                    y: uint256(0x2f9b61534d129b46c329fe1c84c4c7055488a55e4e2471e0e33211c546829f41)
                }),
                qr: Honk.G1Point({
                    x: uint256(0x17c6ad607b8d6ce68d61f03485cdbcaa6412984af87852e4e260e4ea6df0abc5),
                    y: uint256(0x1833a83689c3316d49aa271ce74f510666f2bbf0840731fcf62b3018c17bb2fe)
                }),
                qo: Honk.G1Point({
                    x: uint256(0x0fbb6bf7cdaedc41c6ddf9fb05270143aa25b7f28bf391aef8500ba3e39bde55),
                    y: uint256(0x06219d1b050d2db2daab897200b9ca08436d8c67d994a89829c4d0d3b23c4578)
                }),
                q4: Honk.G1Point({
                    x: uint256(0x0b610cc78d2d34a5f346c87bd2c01e80216fd8e023cbdf580942e1093a851af0),
                    y: uint256(0x04438d603fc2f2af68a6431ad179e20dade9d0dae63d1a603bbf06a644a69d8e)
                }),
                qm: Honk.G1Point({
                    x: uint256(0x1ef0ea5349b9eb85f8f9374336f3ab20409b2161a190bee116f21ba1adba733b),
                    y: uint256(0x139fe43c7fd1013c6f70d20570167d9614a38009539d07d8960e201d807af503)
                }),
                qc: Honk.G1Point({
                    x: uint256(0x19d9167a9b507b4a77938592e4e346cefa8e17a341ad1e035796313635ee8c12),
                    y: uint256(0x05d182e1486e068fa283e81370bd7fe944e2dd10260fd4e4c004a693c0cc10ce)
                }),
                qArith: Honk.G1Point({
                    x: uint256(0x07a503af34c6ddd96801152c0112bb75d2ede95a2138bc9bf6ea87705b7a26c9),
                    y: uint256(0x26f1d7f9f22b44689ef0712fcd8e7a75afc3d70ecfab54f507d71b9b6ef51552)
                }),
                qDeltaRange: Honk.G1Point({
                    x: uint256(0x1d37458d6de271b493b0decf96dee88c3331a1e14b2a9b9401ec0e63c4a94823),
                    y: uint256(0x044e028b20cb02012f5302d104938610388be2b56469f121f4d6898e5af66526)
                }),
                qElliptic: Honk.G1Point({
                    x: uint256(0x1f26c5b4b1785f1c7566cd63e9837b0f8c1522bd834d81c54ab11431fa104765),
                    y: uint256(0x1c26bcca32873a92673e1b02f4a05bea2d4ad2bda21bba9627488653ddfbb4fb)
                }),
                qAux: Honk.G1Point({
                    x: uint256(0x1ccff46f23ecdadd0b18577518793704d06ceb1c3903ca95efdcb402c9c13da8),
                    y: uint256(0x1d9a2bafe621b2aeff631274614ea228ae6a748cf5f72a8df6247695c72b7a56)
                }),
                qLookup: Honk.G1Point({
                    x: uint256(0x304b1f3f6dbf38013e2451e1d3441b59536d30f6f10b2e3d2536666ce5283221),
                    y: uint256(0x276cd8fc9a873e4e071bcba6aff6d9ee4b9bacd691a89401857d9015136a7ef8)
                }),
                qPoseidon2External: Honk.G1Point({
                    x: uint256(0x1e3e2d08e73af62356e5d7de25bdef96815ea22f8265c97ed77a9d0ee63577c1),
                    y: uint256(0x04eb5bff32e8b2b75291102d50c481eb51ec2510bfabb2797a2c787fc472c1b5)
                }),
                qPoseidon2Internal: Honk.G1Point({
                    x: uint256(0x0c9f81ff79002b01550ec431f2b50ff3ce1d03de553757793ef243e7cdbe3590),
                    y: uint256(0x233598faac035b7f72ee09132e4919258026876017ae049aa836774b65dc3ce2)
                }),
                s1: Honk.G1Point({
                    x: uint256(0x01040012e0f27d4b2637b7c6017e7bfa10ed87c886e4a0b59b7c495e91ad8e08),
                    y: uint256(0x16fb22675cd29a4b0b0ca842a18f25638243d19679bf9f2c6f5fe97b792d2579)
                }),
                s2: Honk.G1Point({
                    x: uint256(0x2df18a6882c175641e775f74614575dabc320d7f0c18d9f3e52eaef1b5fd8ac9),
                    y: uint256(0x3016121d9a1450f7ba0169dc6c3ea8270aef194b690b028645bb24f6180d3004)
                }),
                s3: Honk.G1Point({
                    x: uint256(0x2ac2e28734edc40f578da11f2dd7aed3e6d4a0897a14f42da47ad9a78b8c8e65),
                    y: uint256(0x17f57f0b1d11ffdfc061a1ca71210a61f8dc9686f49c7f2787b9325b5aa49c83)
                }),
                s4: Honk.G1Point({
                    x: uint256(0x1a7280814d47ff144a5d67553c5f1590bfb326a7de6f121ad5017bd6ac59aeeb),
                    y: uint256(0x2440bf3bf9d4cd6735094b4fda9abf99aa725b3d8df4b74b21939b1604f2208d)
                }),
                t1: Honk.G1Point({
                    x: uint256(0x2cdb329f4ac54a9b2a6bb49f35b27881fa6a6bb06a51e41a3addbc63b92a09f2),
                    y: uint256(0x09de6f6dce6674dfe0bb9a2d33543b23fa70fdaae3e508356ea287353ff56377)
                }),
                t2: Honk.G1Point({
                    x: uint256(0x011733a47342be1b62b23b74d39fb6a27677b44284035c618a4cfa6c35918367),
                    y: uint256(0x1b6124ff294c0bbe277c398d606ca94bf37bad466915d4b7b1fcfd2ff798705d)
                }),
                t3: Honk.G1Point({
                    x: uint256(0x03c29facc62a18f92c829586f7c4229652a2ca44ecda61e0ec2d6ad75124118e),
                    y: uint256(0x121efb2d3d20663f3c6282ead199b04a2acb274756d757ed64184ba336a452d3)
                }),
                t4: Honk.G1Point({
                    x: uint256(0x2ae1cb509ce1e6f5a706388238a045046c7d1b3a1c534d8d1cd1165deb1b3a33),
                    y: uint256(0x1f0a2bdf6edefdfa216746a70719395d6c1f362f7bacfdb326d34457994ca6c1)
                }),
                id1: Honk.G1Point({
                    x: uint256(0x27ab460bcd2e47a04442f7d0b8fd40645f1658233d1412886b6e9e77b3b57b7c),
                    y: uint256(0x2ea774810cfc34f5b532bef548aa067904eb6792602f0f2f70365b3edffa48fd)
                }),
                id2: Honk.G1Point({
                    x: uint256(0x11006d6f6c7216ffa11038c488f97801761169b2b954f481f8fef72484f9bbd5),
                    y: uint256(0x1eb710eb822fcc3296d94931636d254eabbde49ccdc097e8347be5a8648af6e5)
                }),
                id3: Honk.G1Point({
                    x: uint256(0x0e88df3f35ff361a54d9505f74b893615b85a88892fadd6b7609dc0aa5569317),
                    y: uint256(0x2641f833af7d18b1ed0c2ded2062d96f5d360defb3cb82efaa67c86c9349a257)
                }),
                id4: Honk.G1Point({
                    x: uint256(0x2302e8df5d08ab085f0f1940190ecb561b95d9361219407e2373980b4373901a),
                    y: uint256(0x20e5406a14b1512793a7d88c9f9d8b7713739ff68a10fdfb17c0f6a9e22a3f3c)
                }),
                lagrangeFirst: Honk.G1Point({
                    x: uint256(0x0000000000000000000000000000000000000000000000000000000000000001),
                    y: uint256(0x0000000000000000000000000000000000000000000000000000000000000002)
                }),
                lagrangeLast: Honk.G1Point({
                    x: uint256(0x1ba08f38fb22da4623374e9a860555305b13e2cb2f95b4bd3938211874fe526d),
                    y: uint256(0x11951f6233690c3820a7c428a49c675e3ca82d4db174f77cc39cfd1f93f54329)
                })
            });
        } else if (treeDepth == 8) {
            vk = Honk.VerificationKey({
                circuitSize: uint256(32768),
                logCircuitSize: uint256(15),
                publicInputsSize: uint256(4),
                ql: Honk.G1Point({
                    x: uint256(0x0f02ed71b20343a3fcb0b0461b47a1d5d50ec11f8f7881b26ca9594d6b2459a7),
                    y: uint256(0x2943b0f6de69a682a548d03352cc9ab285e7f98fa7dfce4b8df537227fddfe06)
                }),
                qr: Honk.G1Point({
                    x: uint256(0x233168c02555f61d88c274bb7147ee8ec2ca0329eb552c348e72e467a016cd9f),
                    y: uint256(0x06ff4f7321a183771f32f035c4473d799d27ec6a227c3c62c9004941e5ef231f)
                }),
                qo: Honk.G1Point({
                    x: uint256(0x0e92d0f87a4699f4906f1de5c568fa78bb2b31496cac3eccc1513ade1a06210f),
                    y: uint256(0x055da8f3b8e5db0d5315f5b9f74da4b1d0e6819757c0748ba5d0d3a524746d1f)
                }),
                q4: Honk.G1Point({
                    x: uint256(0x22c7d6cb74c37ac0ce7ac59cdc3eec4222fb4e7588362480e7b0de17640888f6),
                    y: uint256(0x1bd97f312491c02c56785a18e3e83f0119951766531af8b3cd1d5b1d56d9a364)
                }),
                qm: Honk.G1Point({
                    x: uint256(0x148bfa72ca88de353c2de49de35391a416a4c9e8b20a9f80a69350533bb3dc48),
                    y: uint256(0x1227c9e79f15257a3329d59b475d26ca6e67b854502f05bc6661216992623fce)
                }),
                qc: Honk.G1Point({
                    x: uint256(0x0e04ec4d407bd23f93ff50b0622a0a819614bbab1ceecc2b0f8640616729d822),
                    y: uint256(0x28110aefb4dbacd60e44e85bc46fe7b3f00b4254eb87c19c6a835794464ebc47)
                }),
                qArith: Honk.G1Point({
                    x: uint256(0x0d3e400030a54db055557ecb1fccba3630d58ad8910e2ad0880a5235952b3fa7),
                    y: uint256(0x041637492a79763424d921d8d82bd517467aa2c50260cc8e45ed47c0a1a91872)
                }),
                qDeltaRange: Honk.G1Point({
                    x: uint256(0x15a3d5487c728a4a01c1cd84f3eafece6691816a124cf3ac95b8f2af80a0dce5),
                    y: uint256(0x0aa31023628039e5b70e0546bdd43bee67e99813453375362f98045e58fcb917)
                }),
                qElliptic: Honk.G1Point({
                    x: uint256(0x058ef1e27a5013068ad23f5be7cf9f1ae31e64b06e5846bb83bc108eef1abdb9),
                    y: uint256(0x2c35762c2ccc34bc4d64e7afbbb9af18b15380d3952a942c3d5f37d9189e2698)
                }),
                qAux: Honk.G1Point({
                    x: uint256(0x1d195ddf4443eca840cdfb38fd3f496ccc1c44045fa51ffc0cf3bbee22da8b16),
                    y: uint256(0x112d299da925923d5d986a54ac2329b6cfc6c0e2bf541ebb3acb84baec0abc19)
                }),
                qLookup: Honk.G1Point({
                    x: uint256(0x304b1f3f6dbf38013e2451e1d3441b59536d30f6f10b2e3d2536666ce5283221),
                    y: uint256(0x276cd8fc9a873e4e071bcba6aff6d9ee4b9bacd691a89401857d9015136a7ef8)
                }),
                qPoseidon2External: Honk.G1Point({
                    x: uint256(0x0c111e59e3872c5f5ae9516d90d64eb167b7151b135284fdcef4432d68483303),
                    y: uint256(0x2ae2efa3d5b418f73b7f4383924c53b21175d6aa3ef2c2d773aadf1fdded4b72)
                }),
                qPoseidon2Internal: Honk.G1Point({
                    x: uint256(0x21d12f600e46f660264a80b8cd5372cc9132f96fe402d51abfdc60d8baeaf657),
                    y: uint256(0x07b125531dccbce0bfd058106833541f373d860f2be5c49e17078d654f321c7d)
                }),
                s1: Honk.G1Point({
                    x: uint256(0x0d9a268c07d757adf2882078c1e06a41f3ea2fcac9ae30b8013eae19f1147205),
                    y: uint256(0x295ac6c271afe27926bb21db3db764a1bedc1fa8645384af29cb0c8de1ec524f)
                }),
                s2: Honk.G1Point({
                    x: uint256(0x06f275ee790c68b9e869dea7f0e3f8d7b61f2f697e86ee4cc1631fa4869fd088),
                    y: uint256(0x30592602cd5027a396b72f05d09f63f556133f14385b9274edde7481c43a1079)
                }),
                s3: Honk.G1Point({
                    x: uint256(0x09b7038febfc665b1763fca3c0ae6e78fdf98bbf76ec1b9846c5e882e962d095),
                    y: uint256(0x05b5f110e5a0254b91e779438702ab0d9559a236a9b437deab8dad8e35446e20)
                }),
                s4: Honk.G1Point({
                    x: uint256(0x01d7925740a42f6f8c18b7e13bfe613c45ccd63bb9f327702e2904c442af3880),
                    y: uint256(0x097309113efd1842613d3217305e4dc3c26c6aee0d77e6eade1a8f9a4e4826d7)
                }),
                t1: Honk.G1Point({
                    x: uint256(0x2cdb329f4ac54a9b2a6bb49f35b27881fa6a6bb06a51e41a3addbc63b92a09f2),
                    y: uint256(0x09de6f6dce6674dfe0bb9a2d33543b23fa70fdaae3e508356ea287353ff56377)
                }),
                t2: Honk.G1Point({
                    x: uint256(0x011733a47342be1b62b23b74d39fb6a27677b44284035c618a4cfa6c35918367),
                    y: uint256(0x1b6124ff294c0bbe277c398d606ca94bf37bad466915d4b7b1fcfd2ff798705d)
                }),
                t3: Honk.G1Point({
                    x: uint256(0x03c29facc62a18f92c829586f7c4229652a2ca44ecda61e0ec2d6ad75124118e),
                    y: uint256(0x121efb2d3d20663f3c6282ead199b04a2acb274756d757ed64184ba336a452d3)
                }),
                t4: Honk.G1Point({
                    x: uint256(0x2ae1cb509ce1e6f5a706388238a045046c7d1b3a1c534d8d1cd1165deb1b3a33),
                    y: uint256(0x1f0a2bdf6edefdfa216746a70719395d6c1f362f7bacfdb326d34457994ca6c1)
                }),
                id1: Honk.G1Point({
                    x: uint256(0x0cf6785ab74dcd2b9a358266ce9285d1b8f74f2925b29523cd67f39ad30b164f),
                    y: uint256(0x2c27cd3a6557136d9f41efe2e8043ce00bdf76594256af4a5d4edb9650667987)
                }),
                id2: Honk.G1Point({
                    x: uint256(0x05cdcffe86748b7f7716d4de97bbb8eeaa264d6fab505be8a6ea7b38610ca2ad),
                    y: uint256(0x1c16c582b66f2e98985aca3fe9e1d0ffae347f52bacb4610a7dd9004fcb996ff)
                }),
                id3: Honk.G1Point({
                    x: uint256(0x189ebab9884ba48633dccaef6aab27c21585cb3a93b77f4738bf966dc1e88038),
                    y: uint256(0x06735e18c768ce16b0247d39e4ebdeda8a1cb1949449e8738a6a9fbc95b8744b)
                }),
                id4: Honk.G1Point({
                    x: uint256(0x0d8f5aa7c586f2b34b8cec407b074e09364e015a8a25d46624eb936ddbcb7736),
                    y: uint256(0x0abfc6969965e97fd64008e002f0d47d5e9d587f0b81c19ab12c2f95fbec8f14)
                }),
                lagrangeFirst: Honk.G1Point({
                    x: uint256(0x0000000000000000000000000000000000000000000000000000000000000001),
                    y: uint256(0x0000000000000000000000000000000000000000000000000000000000000002)
                }),
                lagrangeLast: Honk.G1Point({
                    x: uint256(0x2aae4d11020ed65fced7cf34997d45a7c7d589d6e4ef412d5719a2da69444ff3),
                    y: uint256(0x164f002015caa6951639414069509641bfb7136c603458ba92c175ee9fef7c96)
                })
            });
        } else if (treeDepth == 16) {
            vk = Honk.VerificationKey({
                circuitSize: uint256(65536),
                logCircuitSize: uint256(16),
                publicInputsSize: uint256(4),
                ql: Honk.G1Point({
                    x: uint256(0x2a1a05315a78701f2f50fa634c80464292fd4c43766dc5cbf46c604f4d24e664),
                    y: uint256(0x07abd34692a52862a6890dc2e6746eed08d8934650a90e7ce10aff921f72afff)
                }),
                qr: Honk.G1Point({
                    x: uint256(0x20b24632f9e37cf93872c3c10a14534eba9dd92fb055eea403edccc95741e6f3),
                    y: uint256(0x16d139b25360c8181955eb28a6e258d04c4cf13c6a02c3f02fd192299d77bc5e)
                }),
                qo: Honk.G1Point({
                    x: uint256(0x09e52a258dc8772265e0df3bfd41083be0c2f652e59698c07d74176156f64b20),
                    y: uint256(0x15eff7b0f61bf44737dc7973977262f94ba0340a59e338a997728ae2368d8486)
                }),
                q4: Honk.G1Point({
                    x: uint256(0x24fa39b3479eaf58330bce4cdbd4e56c80101704a84e4de2aabeb322bb0668b7),
                    y: uint256(0x305ae0840a16a40afbd8d024355e8c88b9eb17f26ae24a2b6a6cc5982233cfb2)
                }),
                qm: Honk.G1Point({
                    x: uint256(0x22fd9bc3ab1a999cdde133563195ad878086c11b6dbfd3722094f848cda540fc),
                    y: uint256(0x107a976d4540ca227059d2dbae37563215b0d0120d02cf974f491f0b62b4881d)
                }),
                qc: Honk.G1Point({
                    x: uint256(0x16b11349109ef5a5ef70336d2285a5a873e4461f58721861844c1c7075b52b4e),
                    y: uint256(0x0d5530eacf4287275723b8549c0abfe23de79bba3ed87a7157673dd8b1e5339d)
                }),
                qArith: Honk.G1Point({
                    x: uint256(0x01b270e45e64986b184c8735dda26e3084c34c2399610a286d01c6b2031dd821),
                    y: uint256(0x07f247e86c22b2c69842b0044ed0b6282808f28919ff850785360499d3ad283a)
                }),
                qDeltaRange: Honk.G1Point({
                    x: uint256(0x22135c0eb77c87a0c70348329d02749864955f2d0f5c6dad366bb9f5a7d68940),
                    y: uint256(0x2eae0dee398fb1cd026bf22994a39d88c15dbbf25cab643c133f0ef336e07738)
                }),
                qElliptic: Honk.G1Point({
                    x: uint256(0x10235e46dc23bdaf12a516d55d7e146d7fb20a452f2e4eca424b8c88005dbb96),
                    y: uint256(0x2b316252ac3adddb928c1ef0cb089b3b53e0b40e12bc35a831638ede0b7bd102)
                }),
                qAux: Honk.G1Point({
                    x: uint256(0x25f92da36688f59ed92e32d4f0a8417dc5937e1a1c7091b7a0e78f442c90febb),
                    y: uint256(0x2c65858ce3bb6e0242a2a9de1d4516437d838e7e0d753445b10455c503fae28e)
                }),
                qLookup: Honk.G1Point({
                    x: uint256(0x304b1f3f6dbf38013e2451e1d3441b59536d30f6f10b2e3d2536666ce5283221),
                    y: uint256(0x276cd8fc9a873e4e071bcba6aff6d9ee4b9bacd691a89401857d9015136a7ef8)
                }),
                qPoseidon2External: Honk.G1Point({
                    x: uint256(0x295bd95414e3dc75bc506c64cf0e1be2b2c0c050b17c68cff1b5bf8276f6ed3e),
                    y: uint256(0x2b2f16373c80aca8524fea3cc27d35e47e7f448f5a5e81261da3f37c0fb45dcb)
                }),
                qPoseidon2Internal: Honk.G1Point({
                    x: uint256(0x2ec62b76d8ab57a63f23c7fe7f0ab65ed0dc93ce94c935dbc786de9d43198c45),
                    y: uint256(0x3061029c3878212cb04c87471d8fd3ef6055cc4eb7ebc48bd3fe46ed6e4df676)
                }),
                s1: Honk.G1Point({
                    x: uint256(0x0b10188b6cf19f4d75bb4860eab4b4c442ac5ad280d5b1a118d0baa18aba1804),
                    y: uint256(0x0964a17da70346ee5a360d0094a66032e0502a3ea2168ec9d2f62dd991a11f4a)
                }),
                s2: Honk.G1Point({
                    x: uint256(0x2ca89aad2102b5b56cb79edbe8acb24bc3b856e1d8e5a79bd9b6500101f72fea),
                    y: uint256(0x14dcf80ddf37ba5299c61c0a12809315560cfba8cf9e15aedb50a0d95a4d7390)
                }),
                s3: Honk.G1Point({
                    x: uint256(0x228866d00f04d3651024b9e34486a9ea720d58faff4d50c2249d001c17649bfd),
                    y: uint256(0x04f46c5288dacb672bd6ac4585651631fc10a900bf544026710ba3894aedd367)
                }),
                s4: Honk.G1Point({
                    x: uint256(0x27493a8e4d3537fbadffafaf34140494d0e1d2c0fff4382cae789f1fc69ecead),
                    y: uint256(0x0d26888e45df3010704539b69186a3e78eb5f7c33db66fd7b43c727520bd334d)
                }),
                t1: Honk.G1Point({
                    x: uint256(0x2cdb329f4ac54a9b2a6bb49f35b27881fa6a6bb06a51e41a3addbc63b92a09f2),
                    y: uint256(0x09de6f6dce6674dfe0bb9a2d33543b23fa70fdaae3e508356ea287353ff56377)
                }),
                t2: Honk.G1Point({
                    x: uint256(0x011733a47342be1b62b23b74d39fb6a27677b44284035c618a4cfa6c35918367),
                    y: uint256(0x1b6124ff294c0bbe277c398d606ca94bf37bad466915d4b7b1fcfd2ff798705d)
                }),
                t3: Honk.G1Point({
                    x: uint256(0x03c29facc62a18f92c829586f7c4229652a2ca44ecda61e0ec2d6ad75124118e),
                    y: uint256(0x121efb2d3d20663f3c6282ead199b04a2acb274756d757ed64184ba336a452d3)
                }),
                t4: Honk.G1Point({
                    x: uint256(0x2ae1cb509ce1e6f5a706388238a045046c7d1b3a1c534d8d1cd1165deb1b3a33),
                    y: uint256(0x1f0a2bdf6edefdfa216746a70719395d6c1f362f7bacfdb326d34457994ca6c1)
                }),
                id1: Honk.G1Point({
                    x: uint256(0x14fdef39aceb4c790a18060d6458280b34c8e5ae2a2d134f87d7ba2d8384e3be),
                    y: uint256(0x289ada02cdfe9f82a3edde5a00e851e4a2988b70d15b7704bbd60cc0f2086228)
                }),
                id2: Honk.G1Point({
                    x: uint256(0x1056c16dd7c1e22aad73ac1f7bcaf987e6e84a217b8e367f8613aa3e04b43262),
                    y: uint256(0x21f1a616533e6667053d625623e521cfb51eb0de7db0799b320bb7a77ee0b38f)
                }),
                id3: Honk.G1Point({
                    x: uint256(0x2c7b14e3df8b7d79d72ac47074eb803db56c853e7a39f9c70aa2a40487faf85c),
                    y: uint256(0x2623761c56db627510bc0d3cf290e23576ec871601693000f657b4cb370266b2)
                }),
                id4: Honk.G1Point({
                    x: uint256(0x0349125b2dc00c50b4cb59092cfc45a7b702d295e81da18aa76ed1f82202e310),
                    y: uint256(0x2d19222d7ad5852a9c3c31a5a87910d50811075c5b63ce7adff488c133d8b3ac)
                }),
                lagrangeFirst: Honk.G1Point({
                    x: uint256(0x0000000000000000000000000000000000000000000000000000000000000001),
                    y: uint256(0x0000000000000000000000000000000000000000000000000000000000000002)
                }),
                lagrangeLast: Honk.G1Point({
                    x: uint256(0x09792a2086e7db28d0890decb13b4e8c69d5e96e511549a495ae7a42ee75b8d2),
                    y: uint256(0x13f9057aa79db3dca685536cacd3d800f01872b45e746bc441d499b6c30a9479)
                })
            });
        } else if (treeDepth == 24) {
            vk = Honk.VerificationKey({
                circuitSize: uint256(65536),
                logCircuitSize: uint256(16),
                publicInputsSize: uint256(4),
                ql: Honk.G1Point({
                    x: uint256(0x149c7e22ae0df9f66770f74a94b520d96888e52435ff974b01a2b989d4204b04),
                    y: uint256(0x0ca70e204556fa76b4c3482753c92810adfd8b0afda4ed2f6f0b8373c718cf41)
                }),
                qr: Honk.G1Point({
                    x: uint256(0x2898510f285367112364afeb4a1fd0a2d0380f42e5f9a0959dde0338ce6c6736),
                    y: uint256(0x1b5f88f35e1dcf5f92ac8c81f264fc03331b4dc08abb3b3223611be662fb3c5c)
                }),
                qo: Honk.G1Point({
                    x: uint256(0x25b491245a03e607a187325b59480bc0cf07e330208c1776cdc1926789c2b52f),
                    y: uint256(0x2817ea5b931aad8e714b6f04218a688c8c6a768dcaf2ab2166d2d66f0ce7df01)
                }),
                q4: Honk.G1Point({
                    x: uint256(0x0599bd38f51e80ef7614e8f2e9df83f0fee4697e0138faf9f2b90d9ef697e532),
                    y: uint256(0x157c8fd55b6d3348422ab6dd10885706caca45164690097850cd5d790bf8bc75)
                }),
                qm: Honk.G1Point({
                    x: uint256(0x1d610ab110024115251fb5fb83401961a91504927a4c18bcd3202ec362de0ce3),
                    y: uint256(0x2eea6a84cf3d61c390be24171e62a54395d00bd5c45a98227f8495afa0b3a2eb)
                }),
                qc: Honk.G1Point({
                    x: uint256(0x2f328015d49531c3a2f28bf933f4be8af8fd2d4a3bd83b33cd5f6868f8ee22fa),
                    y: uint256(0x2cf077a5208a4c4b9466f76fedc936bbea654d4d97cc5b6df615100aa147a171)
                }),
                qArith: Honk.G1Point({
                    x: uint256(0x0866e8c80319f48f08f506e54b0065a684b9b4efea514f11f9c9297cb025794d),
                    y: uint256(0x08fe088db06519dbcae637bba4d69cfca7e4ae38c39cc4911eafa82cfe9ccdaf)
                }),
                qDeltaRange: Honk.G1Point({
                    x: uint256(0x216f24945fcb22498ed087c4c05d69267c04ca3643a96d376c65cc349165c981),
                    y: uint256(0x1c43795bd5c466ad6d18f8110e9e529fb2238317d52e8a425e0fed89fec26374)
                }),
                qElliptic: Honk.G1Point({
                    x: uint256(0x06fa09a1ddfeb7ccaf2ed0c672644789a149a6a7bfd1e5b42b02826540bf531a),
                    y: uint256(0x18ae90f02a47d7e66ebc957911d01b7029fb8ddaf1559a7fc0bb547c88454402)
                }),
                qAux: Honk.G1Point({
                    x: uint256(0x0205a87b33f641468a3eddc18589364b79a5bf752c38a7cc6add6df9177ed1b2),
                    y: uint256(0x2aa7036bf7337cf0f52972ebb2db663af536f9c2fd69bfce8b98da43d7139bfb)
                }),
                qLookup: Honk.G1Point({
                    x: uint256(0x304b1f3f6dbf38013e2451e1d3441b59536d30f6f10b2e3d2536666ce5283221),
                    y: uint256(0x276cd8fc9a873e4e071bcba6aff6d9ee4b9bacd691a89401857d9015136a7ef8)
                }),
                qPoseidon2External: Honk.G1Point({
                    x: uint256(0x171ed6e12926f720dadf57429f8dbe3c1724bd10ffe89e840e3bf63b78276ac0),
                    y: uint256(0x064797005e7ab1d3bc482b66832fd9ac32d9d6c3a5770e44bd10afd69d30c25a)
                }),
                qPoseidon2Internal: Honk.G1Point({
                    x: uint256(0x00b49ebfd08054c1cec74baa299d1ad9164bca9f2c6baed389822920ccdd0a50),
                    y: uint256(0x15c580f84000e1363be5e891b0cbd8dd5a7c805d4b8049a7a9bc5d804940bd1d)
                }),
                s1: Honk.G1Point({
                    x: uint256(0x069a944dda01cf90cb0d5702b95fadd09a3e53f84cf02a344b5258a886f8732d),
                    y: uint256(0x12982f64d834ff0fcee7b1038cb1a2b336ebeb664ed94cf8a995e61e15f2391a)
                }),
                s2: Honk.G1Point({
                    x: uint256(0x1170f7815cd9fa0bfdb8d8b51b9478f6f61ab5bd0580ae155b0fbbe7fe0ee7e1),
                    y: uint256(0x044d52f6b8b66fc202864c28b77e1b92b6dd9cc6080c8e9cc09f4d280c769dc1)
                }),
                s3: Honk.G1Point({
                    x: uint256(0x24536ad86ab61bb6a4dc5a86b0a2fb9695d51b314a169cf8289e35c6562466de),
                    y: uint256(0x0b43e43d7054344825018841bbe800a501199c791142576e2c11d23d3968f3c7)
                }),
                s4: Honk.G1Point({
                    x: uint256(0x1ec1a7a172bf212d116583184793c3c0bcf4051c29fe3a2e22a2c482eb9e0e0e),
                    y: uint256(0x04df9e6439cbb03f596f85bfbf48fdca87232884964d3b136b71c3dceda41d3d)
                }),
                t1: Honk.G1Point({
                    x: uint256(0x2cdb329f4ac54a9b2a6bb49f35b27881fa6a6bb06a51e41a3addbc63b92a09f2),
                    y: uint256(0x09de6f6dce6674dfe0bb9a2d33543b23fa70fdaae3e508356ea287353ff56377)
                }),
                t2: Honk.G1Point({
                    x: uint256(0x011733a47342be1b62b23b74d39fb6a27677b44284035c618a4cfa6c35918367),
                    y: uint256(0x1b6124ff294c0bbe277c398d606ca94bf37bad466915d4b7b1fcfd2ff798705d)
                }),
                t3: Honk.G1Point({
                    x: uint256(0x03c29facc62a18f92c829586f7c4229652a2ca44ecda61e0ec2d6ad75124118e),
                    y: uint256(0x121efb2d3d20663f3c6282ead199b04a2acb274756d757ed64184ba336a452d3)
                }),
                t4: Honk.G1Point({
                    x: uint256(0x2ae1cb509ce1e6f5a706388238a045046c7d1b3a1c534d8d1cd1165deb1b3a33),
                    y: uint256(0x1f0a2bdf6edefdfa216746a70719395d6c1f362f7bacfdb326d34457994ca6c1)
                }),
                id1: Honk.G1Point({
                    x: uint256(0x1cabdaac8669657e3092af3fa3ec29c023d435a74f3a0e5e710dae0439c811b8),
                    y: uint256(0x101e8f5846a94606fd307bafc6ee44bd8e03530b3e26929693b9cfe1301f6f80)
                }),
                id2: Honk.G1Point({
                    x: uint256(0x21bb7c86406a0d73edbc5d648b9f7073cb80419703892aec488a20dd147db295),
                    y: uint256(0x1378ddd530805a6defadd5a0011b66583d523048a1a4988bd305d85d101e596d)
                }),
                id3: Honk.G1Point({
                    x: uint256(0x05c907328c542ad2bddd5dd5250a09ca5638d0c50fd5783134a8285c6a66d298),
                    y: uint256(0x0e26e2370926e743dce29bdd9402e7d13044f6fe68772ae8dbdb578af8a154ae)
                }),
                id4: Honk.G1Point({
                    x: uint256(0x00221e28f60b62e11ce59088f604f2722768f1fa0aed0f9262cb1184625f8538),
                    y: uint256(0x0cf00bea7451b7f6a79883efb8a9df8197dce183004687be1c306e3db636f287)
                }),
                lagrangeFirst: Honk.G1Point({
                    x: uint256(0x0000000000000000000000000000000000000000000000000000000000000001),
                    y: uint256(0x0000000000000000000000000000000000000000000000000000000000000002)
                }),
                lagrangeLast: Honk.G1Point({
                    x: uint256(0x1f9d18810141b393cd5317fb2c233146adbf90bcd7875597b9471fe97d6233c4),
                    y: uint256(0x0ddc73175b70655f4a5cc10f04c57f1611bc68304d62d2df7306979c479ee002)
                })
            });
        } else if (treeDepth == 32) {
            vk = Honk.VerificationKey({
                circuitSize: uint256(131072),
                logCircuitSize: uint256(17),
                publicInputsSize: uint256(4),
                ql: Honk.G1Point({
                    x: uint256(0x2851b415422c0dd1aa4e771d89be0fb11efc77cc41a53c610b14134989fd6530),
                    y: uint256(0x2553058e2000bf831c1cdd0531c97524cfe26caa0587f5ed780ad0e3bed49e35)
                }),
                qr: Honk.G1Point({
                    x: uint256(0x202af86239b12c89665916fac70e5784c148c0b43c3566fa4b4ff443a4914eae),
                    y: uint256(0x0ffbcc669e388b664138e9f07f128f341254932cf5fa1c62da2e109198e26e98)
                }),
                qo: Honk.G1Point({
                    x: uint256(0x1a8bb070f8d4eb417dae2cd69f64b5243475eb3a9f29673885044629604c4f84),
                    y: uint256(0x220d4c3e04f5e66eb3b01766c76d8b12815138d3ac2d83189364f046a878f57f)
                }),
                q4: Honk.G1Point({
                    x: uint256(0x23d0f584b5e8c4eaf3dad1ef9066993fdd0c2e956f9ead03f4135b9e43126794),
                    y: uint256(0x0ac95f6040f3596a9ce964170737e4982faeaf2344d467b24e098c0d63e6bd36)
                }),
                qm: Honk.G1Point({
                    x: uint256(0x029f36b50ce3c4d43e0a43b6dee084317aa16e8f6cbd90f889e9ad25850ce94a),
                    y: uint256(0x111aeab43aef6a588bbba09c57212301a3512ad372a0323abba20f00024c2dcd)
                }),
                qc: Honk.G1Point({
                    x: uint256(0x231f5619062c185abf7d40748d4d347f8a16f4f38a009e6016116ac83189e93a),
                    y: uint256(0x10faa513a4d670a19d6886d0d76fe6c7d917c849e919a78cb99ad86eea8b310e)
                }),
                qArith: Honk.G1Point({
                    x: uint256(0x21c162adc39b98db654441c33a8ee29256cf418c537646876d470afe38f6b63b),
                    y: uint256(0x2f53e6538185664ea72b7df20e7fc096ce7d2727516182f98620016bbf6b346e)
                }),
                qDeltaRange: Honk.G1Point({
                    x: uint256(0x10f646b0557ede3a81e30726470171cd1e4fd3b6ee5723f2d9d9b7dc19812d62),
                    y: uint256(0x035f27a8d4dffce3352c9c6b45643501eb2f42f4c2d81bd1586277b8e4104bac)
                }),
                qElliptic: Honk.G1Point({
                    x: uint256(0x1119ced82d34d91c31db512dfe0f51ad63610dc0ab5ffc77ba36156288f77eac),
                    y: uint256(0x25035e9bc728ab2bb59e23e34d5ed1abc3438694bd75ac060b17c8cdf17cae06)
                }),
                qAux: Honk.G1Point({
                    x: uint256(0x229d68298772a49c6f25b6b09352f8bd1102126a69012ead6f646ec483e435a3),
                    y: uint256(0x13d461e8b92520e4060f6f2a0bab95eecdec23352444475c281b4f485a090201)
                }),
                qLookup: Honk.G1Point({
                    x: uint256(0x304b1f3f6dbf38013e2451e1d3441b59536d30f6f10b2e3d2536666ce5283221),
                    y: uint256(0x276cd8fc9a873e4e071bcba6aff6d9ee4b9bacd691a89401857d9015136a7ef8)
                }),
                qPoseidon2External: Honk.G1Point({
                    x: uint256(0x0d3fcec2d779afdc6d578f73edcecea2b3e0b6af9cb92a451a2b3a8b4c3adbf5),
                    y: uint256(0x00806a745f1a6902512040221fd2f3ebca19314b5831d7c1a86eb720ba93dd13)
                }),
                qPoseidon2Internal: Honk.G1Point({
                    x: uint256(0x00730095d16196ba72ec0c6b30976d22e00746ae64886b2163ac02396a7c9410),
                    y: uint256(0x1dae8cd0c12938e4a8d6f9f0afa3e9a142a9d03f18eb294823a735efbdca0769)
                }),
                s1: Honk.G1Point({
                    x: uint256(0x12b947bead58c281500ae0762ba605dc9993f994efe57a8a54987667febec34e),
                    y: uint256(0x138ed404b89e314aeb2c286a36d0a694964ba546a2d46c9d7167d9fd63e7f9a7)
                }),
                s2: Honk.G1Point({
                    x: uint256(0x2ff89f269a16049e3d96c34392903a0309d1ff2e0440127a5e27de5e28a5949c),
                    y: uint256(0x2c91ecc45d167d113d3873468bfaa6b21ed90d6b5db0808c87c140dff6844ceb)
                }),
                s3: Honk.G1Point({
                    x: uint256(0x171046f823dba0eaf0984384417549828bcd824d2324d4ba004f7b48303318bb),
                    y: uint256(0x21e3108942b585a5f29013cc64aa02923cafd0130fc146c80e097624ae5274fa)
                }),
                s4: Honk.G1Point({
                    x: uint256(0x0cd8440c0467f9914387c9f60b1313c5954d199ec67719dd21a9fb094439a237),
                    y: uint256(0x0e8805605384bc1eff1becdb230300875d2ab6d5e3965ed63737f30857024852)
                }),
                t1: Honk.G1Point({
                    x: uint256(0x2cdb329f4ac54a9b2a6bb49f35b27881fa6a6bb06a51e41a3addbc63b92a09f2),
                    y: uint256(0x09de6f6dce6674dfe0bb9a2d33543b23fa70fdaae3e508356ea287353ff56377)
                }),
                t2: Honk.G1Point({
                    x: uint256(0x011733a47342be1b62b23b74d39fb6a27677b44284035c618a4cfa6c35918367),
                    y: uint256(0x1b6124ff294c0bbe277c398d606ca94bf37bad466915d4b7b1fcfd2ff798705d)
                }),
                t3: Honk.G1Point({
                    x: uint256(0x03c29facc62a18f92c829586f7c4229652a2ca44ecda61e0ec2d6ad75124118e),
                    y: uint256(0x121efb2d3d20663f3c6282ead199b04a2acb274756d757ed64184ba336a452d3)
                }),
                t4: Honk.G1Point({
                    x: uint256(0x2ae1cb509ce1e6f5a706388238a045046c7d1b3a1c534d8d1cd1165deb1b3a33),
                    y: uint256(0x1f0a2bdf6edefdfa216746a70719395d6c1f362f7bacfdb326d34457994ca6c1)
                }),
                id1: Honk.G1Point({
                    x: uint256(0x105a528b4047aeaf42c934b28e38ad3148d2b7dbc2fa5e8c25f52024c5a5c9e8),
                    y: uint256(0x1fe07744ae5500cf3a8882adb0173c03284c921e1d8cb047506c3b1b3c74554e)
                }),
                id2: Honk.G1Point({
                    x: uint256(0x223d84cf2abcf61e7a4be0513c79717b2024bbbb322867a671a5fea8aeeb1577),
                    y: uint256(0x0ad8bada2437f53dd906a292cc20237cff55da470e085d7acdd16a1b0137bd63)
                }),
                id3: Honk.G1Point({
                    x: uint256(0x2982bd2997606eeb04639d79640656aaa90fd2fa20ea8897c4afb3318721859f),
                    y: uint256(0x1c0660d7cf2a64242cea73fcccbb9a28a984933d3a5f4aa4b7288620a6865eed)
                }),
                id4: Honk.G1Point({
                    x: uint256(0x2ec9c5774b0ecbc7f0ec3c502338ec134da77eb6ef8ab604eaaebafa60083c8e),
                    y: uint256(0x17c1da2c9ea04be386718420b9593fce3d61f847e7444f785b1dec2a87ed7e2e)
                }),
                lagrangeFirst: Honk.G1Point({
                    x: uint256(0x0000000000000000000000000000000000000000000000000000000000000001),
                    y: uint256(0x0000000000000000000000000000000000000000000000000000000000000002)
                }),
                lagrangeLast: Honk.G1Point({
                    x: uint256(0x029298dd73b3f1187d40c0e89bbd228ff12f7ae255eae0b2a0e44c34183de399),
                    y: uint256(0x1cae0ac4a8feeefe158ac1416a560c49baa0d467e4837dc5df2fc21127510bcf)
                })
            });
        } else {
            revert("Unsupported tree depth");
        }

        return vk;
    }
}
