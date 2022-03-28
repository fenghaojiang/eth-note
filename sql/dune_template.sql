SELECT date, sum(users) OVER (
                              ORDER BY date ASC ROWS BETWEEN unbounded preceding AND CURRENT ROW) AS total_users
FROM
  (SELECT date, count(USER) AS users
   FROM
     (SELECT min(date) AS date,
             account AS USER
      FROM
        (SELECT date_trunc('day', min(block_time)) AS date,
                trader_a AS account
         FROM dex.trades
         WHERE project = 'Uniswap'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)) AS date,
                          trader_b AS account
         FROM dex.trades
         WHERE project = 'Uniswap'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM uniswap."Exchange_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(call_block_time)) AS date,
                          "to" AS account
         FROM uniswap_v2."Router01_call_addLiquidity"
         WHERE call_success
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(call_block_time)) AS date,
                          "to" AS account
         FROM uniswap_v2."Router01_call_addLiquidityETH"
         WHERE call_success
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(call_block_time)) AS date,
                          "to" AS account
         FROM uniswap_v2."Router02_call_addLiquidity"
         WHERE call_success
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(call_block_time)) AS date,
                          "to" AS account
         FROM uniswap_v2."Router02_call_addLiquidityETH"
         WHERE call_success
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          "to" AS account
         FROM uniswap_v3."NonfungibleTokenPositionManager_evt_Transfer"
         WHERE "from" = '\x0000000000000000000000000000000000000000'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)) AS date,
                          trader_a AS account
         FROM dex.trades
         WHERE project = 'Kyber'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)) AS date,
                          trader_b AS account
         FROM dex.trades
         WHERE project = 'Kyber'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          minter AS account
         FROM compound_v2."cErc20_evt_Mint"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          borrower AS account
         FROM compound_v2."cErc20_evt_Borrow"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          minter AS account
         FROM compound_v2."cEther_evt_Mint"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          borrower AS account
         FROM compound_v2."cEther_evt_Borrow"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          account
         FROM compound_v1."MoneyMarket_evt_SupplyReceived"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          account
         FROM compound_v1."MoneyMarket_evt_BorrowTaken"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          _user AS account
         FROM aave."LendingPool_evt_Borrow"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          _user AS account
         FROM aave."LendingPool_evt_Deposit"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          "user" AS account
         FROM aave_v2."LendingPool_evt_Borrow"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          "user" AS account
         FROM aave_v2."LendingPool_evt_Deposit"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)) AS date,
                "from" AS account
         FROM ethereum."transactions"
         WHERE "to" in ('\x9ca85572e6a3ebf24dedd195623f188735a5179f', -- 3CRV
                        '\x29E240CFD7946BA20895a7a02eDb25C210f9f324', -- aLINK
                        '\x03403154afc09Ce8e44C3B185C82C6aD5f86b9ab', -- crvAAVE
                        '\xE625F5923303f1CE7A43ACFEFd11fd12f30DbcA4', -- crvAETH
                        '\xE625F5923303f1CE7A43ACFEFd11fd12f30DbcA4', -- crvBBTC
                        '\x2994529c0652d127b7842094103715ec5299bbed', -- crvBUSD
                        '\x629c759D1E83eFbF63d84eb3868B564d9521C129', -- crvCOMP
                        '\x8e6741b456a074F0Bc45B8b82A755d4aF7E965dF', -- crvDUSD
                        '\xec0d8d3ed5477106c6d4ea27d90a60e594693c90', -- crvGUSD
                        '\x46AFc2dfBd1ea0c0760CAD8262A5838e803A37e5', -- crvHBTC
                        '\x39546945695DCb1c037C836925B355262f551f55', -- crvHUSD
                        '\x96Ea6AF74Af09522fCB4c28C269C26F59a31ced6', -- crvLINK
                        '\x0FCDAeDFb8A7DfDa2e9838564c5A1665d856AFDF', -- crvMUSD
                        '\x7F83935EcFe4729c4Ea592Ab2bC1A32588409797', -- crvOBTC
                        '\x123964EbE096A920dae00Fb795FFBfA0c9Ff4675', -- crvPBTC
                        '\x5334e150B938dd2b6bd040D9c4a03Cff0cED3765', -- crvRENBTC
                        '\xBacB69571323575C6a5A3b4F9EEde1DC7D31FBc1', -- crvSAAVE
                        '\x7Ff566E1d69DEfF32a7b244aE7276b9f90e9D0f6', -- crvSBTC
                        '\x5533ed0a3b83F70c3c4a1f69Ef5546D3D4713E44', -- crvSUSD
                        '\x07FB4756f67bD46B748b16119E802F1f880fb2CC', -- crvTBTC
                        '\xFe39Ce91437C76178665D64d7a2694B0f6f17fE3', -- crvUSDN
                        '\x1B5eb1173D2Bf770e50F10410C9a96F7a8eB6e75', -- crvUSDP
                        '\xF6C9E9AF314982A4b38366f4AbfAa00595C5A6fC', -- crvUST
                        '\x2994529C0652D127b7842094103715ec5299bBed', -- crvYBUSD
                        '\xacd43e627e64355f1861cec6d3a6688b31a6f952', -- DAI
                        '\x98B058b2CBacF5E99bC7012DF757ea7CFEbd35BC', -- eursCRV
                        '\xe11ba472F74869176652C35D30dB89854b5ae84D', -- HEGIC
                        '\x881b06da56BB5675c54E4Ed311c21E54C5025298', -- LINK
                        '\xE0db48B4F71752C4bEf16De1DBD042B82976b8C7', -- mUSD
                        '\xdCD90C7f6324cfa40d7169ef80b12031770B4325', -- steCRV
                        '\x37d19d1c4E1fa9DC47bD1eA12f742a0887eDa74a', -- TUSD
                        '\x597aD1e0c13Bfe8025993D9e79C69E1c0233522e', -- USDC
                        '\x2f08119c6f07c006695e079aafc638b8789faf18', -- USDT
                        '\xe1237aA7f535b0CC33Fd973D66cBf830354D16c7', -- WETH
                        '\x5dbcF33D8c2E976c6b560249878e6F1491Bca25c', -- yCRV
                        '\xba2e7fed597fd0e3e70f5130bcdbbfe06bb94fe1') -- YFI
           AND block_time >= '2020-07-26'
           AND success
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)) AS date,
                          trader_a AS account
         FROM dex.trades
         WHERE project = 'Balancer'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)) AS date,
                          trader_b AS account
         FROM dex.trades
         WHERE project = 'Balancer'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          caller AS account
         FROM balancer."BPool_evt_LOG_JOIN"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          lad AS account
         FROM maker."SaiTub_evt_LogNewCup"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)) AS date,
                          borrower
         FROM lending."borrow"
         WHERE project='MakerDAO'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)) AS date,
                trader_a AS account
         FROM dex.trades
         WHERE project = 'Curve'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)) AS date,
                          trader_b AS account
         FROM dex.trades
         WHERE project = 'Curve'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."aave_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."ankreth_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."bbtc_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."busd_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."compound_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."compound_v2_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."compound_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."threepool_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."dusd_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."eurs_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."gusd_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."hbtc_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."husd_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."ironbank_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."linkusd_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."lusd_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."musd_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."obtc_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."pax_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."pbtc_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."ren_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."reth_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."rsv_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."sbtc_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."seth_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."steth_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."susd_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."susd_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."tbtc_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."tricrypto_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."usdk_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."usdn_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."usdt_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."ust_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          provider AS account
         FROM curvefi."y_swap_evt_AddLiquidity"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          "from" AS account
         FROM tornado_cash."eth_evt_Deposit"
         INNER JOIN ethereum."transactions" ON evt_tx_hash = hash
         AND block_time >= '2019-12-16'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          "to" AS account
         FROM tornado_cash."eth_evt_Withdrawal"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          "from" AS account
         FROM tornado_cash."erc20_evt_Deposit"
         INNER JOIN ethereum."transactions" ON evt_tx_hash = hash
         AND block_time >= '2019-12-16'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          "to" AS account
         FROM tornado_cash."erc20_evt_Withdrawal"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          OWNER AS account
         FROM instadapp_v2."InstaRegistry_evt_Created"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          OWNER AS account
         FROM instadapp_dsa."InstaIndex_evt_LogAccountCreated"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)) AS date,
                          trader_a AS account
         FROM dex.trades
         WHERE project = '0x Native'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)) AS date,
                          trader_b AS account
         FROM dex.trades
         WHERE project = '0x Native'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)) AS date,
                          trader_a AS account
         FROM dex.trades
         WHERE project = 'Sushiswap'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)) AS date,
                          trader_b AS account
         FROM dex.trades
         WHERE project = 'Sushiswap'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(call_block_time)) AS date,
                          "to" AS account
         FROM sushi."Router02_call_addLiquidity"
         WHERE call_success
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(call_block_time)) AS date,
                          "to" AS account
         FROM sushi."Router02_call_addLiquidityETH"
         WHERE call_success
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          maker AS account
         FROM dydx_perpetual."PerpetualV1_evt_LogTrade"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          taker AS account
         FROM dydx_perpetual."PerpetualV1_evt_LogTrade"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          "accountOwner" AS account
         FROM dydx."SoloMargin_evt_LogDeposit"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          "takerAccountOwner" AS account
         FROM dydx."SoloMargin_evt_LogTrade"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          "makerAccountOwner" AS account
         FROM dydx."SoloMargin_evt_LogTrade"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)),
                          "from" AS account
         FROM dydx."PayableMarginMinter_call_mintMarginTokens" dydx
         INNER JOIN ethereum."transactions" tx ON dydx.call_tx_hash = tx.hash
         AND tx.block_time >= '2018-09-28'
         AND call_success
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          sender AS account
         FROM pooltogether."MCDAwarePool_evt_Deposited"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          sender AS account
         FROM pooltogether_v1."Pool1_evt_BoughtTickets"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          sender AS account
         FROM pooltogether_v2."Pool3_evt_Deposited"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
         OPERATOR AS account
         FROM pooltogether_v3."CompoundPrizePool_evt_Deposited"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)) AS date,
                          trader_a AS account
         FROM dex.trades
         WHERE project = 'Bancor Network'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)) AS date,
                          trader_b AS account
         FROM dex.trades
         WHERE project = 'Bancor Network'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)) AS date,
                          trader_a AS account
         FROM dex."trades"
         WHERE project = 'Synthetix'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)) AS date,
                          trader_b AS account
         FROM dex."trades"
         WHERE project = 'Synthetix'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          account
         FROM synthetix."Synth_evt_Issued"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)) AS date,
                          "from" AS account
         FROM ethereum."transactions"
         WHERE "to" = '\xF8ce90c2710713552fb564869694B2505Bfc0846'
           AND block_time >= '2020-08-31'
           AND success
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          minter AS account
         FROM creamfinance."CErc20Delegate_evt_Mint"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          borrower AS account
         FROM creamfinance."CErc20Delegate_evt_Borrow"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          minter AS account
         FROM creamfinance."CEther_evt_Mint"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          borrower AS account
         FROM creamfinance."CEther_evt_Borrow"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          tx."from" AS account
         FROM erc20."ERC20_evt_Transfer" erc
         INNER JOIN ethereum."transactions" tx ON erc.evt_tx_hash = tx.hash
         AND tx.block_time >= '2020-05-13'
         WHERE contract_address = '\xeb4c2781e4eba804ce9a9803c67d0893436bb27d'
           AND erc."from" = '\x0000000000000000000000000000000000000000'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          tx."from" AS account
         FROM erc20."ERC20_evt_Transfer" erc
         INNER JOIN ethereum."transactions" tx ON erc.evt_tx_hash = tx.hash
         AND tx.block_time >= '2020-05-13'
         WHERE contract_address = '\x1c5db575e2ff833e46a2e9864c22f4b22e0b37c2'
           AND erc."from" = '\x0000000000000000000000000000000000000000'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          tx."from" AS account
         FROM erc20."ERC20_evt_Transfer" erc
         INNER JOIN ethereum."transactions" tx ON erc.evt_tx_hash = tx.hash
         AND tx.block_time >= '2020-05-13'
         WHERE contract_address = '\x459086f2376525bdceba5bdda135e4e9d3fef5bf'
           AND erc."from" = '\x0000000000000000000000000000000000000000'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(block_time)) AS date,
                          "from" AS account
         FROM ethereum."transactions"
         WHERE "to" = '\xd7c49cee7e9188cca6ad8ff264c1da2e69d4cf3b'
           AND block_time >= '2019-05-23'
           AND success
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          _borrower AS account
         FROM keeperdao_v1."LiquidityPoolV1_evt_Borrowed"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          _depositor AS account
         FROM keeperdao_v1."LiquidityPoolV1_evt_Deposited"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          _borrower AS account
         FROM keeperdao_v2."LiquidityPoolV2_evt_Borrowed"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          _depositor AS account
         FROM keeperdao_v2."LiquidityPoolV2_evt_Deposited"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          _borrower AS account
         FROM keeperdao_v21."LiquidityPoolV2_evt_Borrowed"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          _depositor AS account
         FROM keeperdao_v21."LiquidityPoolV2_evt_Deposited"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          account
         FROM hegic."HedgeContract_evt_HedgeCreated"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          account
         FROM hegic."HegicERCPool_evt_Provide"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          account
         FROM hegic."HegicETHOptions_evt_Create"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          account
         FROM hegic."HegicETHPool_evt_Provide"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          acount
         FROM hegic."HegicStakingETH_evt_Claim"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          account
         FROM hegic."HegicStakingPool_evt_BuyLot"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          account
         FROM hegic."HegicStakingPool_evt_SellLot"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          account
         FROM hegic."HegicStakingPool_evt_Deposit"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          acount
         FROM hegic."HegicStakingWBTC_evt_Claim"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          account
         FROM hegic."HegicWBTCOptions_evt_Create"
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          "from" AS account
         FROM alpha_homora."Bank_evt_Work"
         INNER JOIN ethereum."transactions" ON evt_tx_hash = hash
         AND block_time >= '2020-10-07'
         GROUP BY 2
         UNION ALL SELECT date_trunc('day', min(evt_block_time)) AS date,
                          "caller" AS account
         FROM alpha_homora_v2."HomoraBank_evt_Borrow"
         GROUP BY 2) AS a
      GROUP BY 2) AS b
   GROUP BY 1
   ORDER BY 1) AS c ;